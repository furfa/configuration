# /bin/bash

flameshot gui & sleep 90; kill $(ps aux | awk '/[f]lameshot/ {print $2}')
