# /bin/bash

flameshot gui & sleep 30; kill $(ps aux | awk '/[f]lameshot/ {print $2}')
