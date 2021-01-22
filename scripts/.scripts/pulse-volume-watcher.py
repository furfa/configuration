#!/usr/bin/env python3
from pulsectl import Pulse, PulseLoopStop
import sys

# Adapt to your use-case
sink_id = 0

with Pulse() as pulse:
    def callback(ev):
        raise PulseLoopStop
    def get_def_sink():
        return pulse.get_sink_by_name(pulse.server_info().default_sink_name) 
    pulse.event_mask_set('sink')
    pulse.event_callback_set(callback)
    last_value = round(get_def_sink().volume.value_flat * 100)
    last_mute = get_def_sink().mute == 1
    while True:
        pulse.event_listen()
        value = round(get_def_sink().volume.value_flat * 100)
        mute = get_def_sink().mute == 1
        if value != last_value or mute != last_mute:
            print(value, end='')
            if mute:
                print('!')
            else:
                print('')
            last_value = value
            last_mute = mute
        sys.stdout.flush()
  # except:
  #   pass
