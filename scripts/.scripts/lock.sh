# !/bin/bash
scrot /tmp/screen_locked.png
mogrify -scale 10% -scale 1000% /tmp/screen_locked.png
betterlockscreen -u /tmp/screen_locked.png -l
