kill $(ps -ax | awk '/--class=kitty-weather/ {print $1}') ||
kitty --class=kitty-weather zsh -c '~/bin/yandex-weather-cli&&read'
