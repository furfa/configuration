#!/bin/bash

ACTIVESYNC=$(pacmd list-sinks | grep \* | awk '{print $3}')
get_default_sink() {
    pacmd stat | awk -F": " '/^Default sink name: /{print $2}'
}
output_volume() {
     pacmd list-sinks | awk '/^\s+name: /{indefault = $2 == "'"<$(get_default_sink)>"'"}
             /^\s+muted: / && indefault {muted=$2}
             /^\s+volume: / && indefault {volume=$5}
             END { print muted=="no"?volume:-volume }'
}

msgId="100000"

notifyMuted() {
        volume="$1"
        dunstify -r "$msgId" -h string:x-canonical-private-synchronous:audio "Muted" -h int:value:"$volume" -t 1500 --icon audio-volume-muted
}

notifyAudio() {
        volume="$1"
        # ponymix is-muted && notifyMuted "$volume" && return

        if [ $volume -le 0 ]; then
          notifyMuted $(echo $volume | sed "s/-//")
        elif [ $volume -le 30 ]; then
                dunstify -r "$msgId" -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"$volume" -t 1500 --icon audio-volume-low
        elif [ $volume -le 70 ]; then
                dunstify -r "$msgId" -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"$volume" -t 1500 --icon audio-volume-medium
        else
                dunstify -r "$msgId" -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"$volume" -t 1500 --icon audio-volume-high
        fi
}

notifyBrightness() {
        brightness="$1"
        if [ $brightness -eq 0 ]; then
                dunstify -r "$msgId" -h string:x-canonical-private-synchronous:brightness "Brightness: " -h int:value:"$brightness" -t 1500 --icon display-brightness-off-symbolic
        elif [ $brightness -le 30 ]; then
                dunstify -r "$msgId" -h string:x-canonical-private-synchronous:brightness "Brightness: " -h int:value:"$brightness" -t 1500 --icon display-brightness-low-symbolic
        elif [ $brightness -le 70 ]; then
                dunstify  -r "$msgId" -h string:x-canonical-private-synchronous:brightness "Brightness: " -h int:value:"$brightness" -t 1500 --icon display-brightness-medium-symbolic
        else
                dunstify  -r "$msgId" -h string:x-canonical-private-synchronous:brightness "Brightness: " -h int:value:"$brightness" -t 1500 --icon display-brightness-high-symbolic
        fi
}

case "$1" in
    raise)
         pactl set-sink-volume "$ACTIVESYNC" +3%;
         notifyAudio $(output_volume | sed "s/%//" )  
         ;;
    lower)
         pactl set-sink-volume "$ACTIVESYNC" -3%;
         notifyAudio $(output_volume | sed "s/%//" )  
         ;;
    mute)
         pactl set-sink-mute "$ACTIVESYNC" toggle;
         notifyAudio $(output_volume | sed "s/%//" )  
         ;;
     get)
         # kill -9 $(ps -ax | grep dzen2 |  grep volume-display | awk -F ' ' '{print $1}' );
         output_volume # dbar -l "volume " -s "|" -min 0 -max 100 -w 50 | dzen2  -title-name "volume-display" -p 1;
         ;;
     brightness)
          notifyBrightness `cat /dev/stdin`
          ;;
esac
