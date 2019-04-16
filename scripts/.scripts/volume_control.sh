#!/bin/bash
 
ACTIVESYNC=$(pacmd list-sinks | grep \* | awk '{print $3}')

case "$1" in
    raise)
         pactl set-sink-volume "$ACTIVESYNC" +3%
         ;;
    lower)
         pactl set-sink-volume "$ACTIVESYNC" -3%
         ;;
    mute)
         pactl set-sink-mute "$ACTIVESYNC" toggle
         ;;
esac
