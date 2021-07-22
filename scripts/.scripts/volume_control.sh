#!/bin/bash
# canberra-gtk-play --id=audio-volume-change

msgId="100000"

notifyMuted() {
        volume="$1"
        dunstify -r "$msgId" -h string:x-canonical-private-synchronous:audio "Muted" -h int:value:"$volume" -t 1500 --icon audio-volume-muted
}

notifyAudio() {
        volume="$1"
        # ponymix is-muted && notifyMuted "$volume" && return

        # if [ $volume -le 0 ]; then
        #   notifyMuted $(echo $volume | sed "s/-//")
        # elif [ $volume -le 30 ]; then
        #         dunstify -r "$msgId" -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"$volume" -t 1500 --icon audio-volume-low
        # elif [ $volume -le 70 ]; then
        #         dunstify -r "$msgId" -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"$volume" -t 1500 --icon audio-volume-medium
        # else
        #         dunstify -r "$msgId" -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"$volume" -t 1500 --icon audio-volume-high
        # fi
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
         pactl set-sink-volume @DEFAULT_SINK@ +3%;
         notifyAudio $(output_volume)  
         ;;
    lower)
         pactl set-sink-volume @DEFAULT_SINK@ -3%;
         notifyAudio $(output_volume)  
         ;;
    mute)
         pactl set-sink-mute  @DEFAULT_SINK@ toggle;
         notifyAudio $(output_volume)  
         ;;
     get)
         output_volume 
         ;;
     brightness)
        notifyBrightness $(cat /dev/stdin)
          ;;
esac

py3-cmd refresh volume_status
