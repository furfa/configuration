#!/bin/bash
 
ACTIVESYNC=$(pacmd list-sinks | grep \* | awk '{print $3}')
get_default_sink() {
    pacmd stat | awk -F": " '/^Default sink name: /{print $2}'
}
output_volume() {
     pacmd list-sinks | awk '/^\s+name: /{indefault = $2 == "'"<$(get_default_sink)>"'"}
             /^\s+muted: / && indefault {muted=$2}
             /^\s+volume: / && indefault {volume=$5}
             END { print muted=="no"?volume:"Muted" }'
}

case "$1" in
    raise)
         pactl set-sink-volume "$ACTIVESYNC" +3%;
         notify-send "volume up $(~/.scripts/volume_control.sh get)";
         ;;
    lower)
         pactl set-sink-volume "$ACTIVESYNC" -3%;
         notify-send "volume down $(~/.scripts/volume_control.sh get)";
         ;;
    mute)
         pactl set-sink-mute "$ACTIVESYNC" toggle;
         notify-send 'volume mute';
         ;;
     get)
         output_volume
         ;;
esac
