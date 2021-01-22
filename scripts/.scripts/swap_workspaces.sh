#/usr/bin/bash
first=$(echo -e "1\n2\n3\n4\n5\n6\n7\n8\n9\n10" | rofi -p "first to switch" -dmenu) &&
second=$(echo -e "1\n2\n3\n4\n5\n6\n7\n8\n9\n10" | rofi -p "second to switch" -dmenu) &&
i3-msg "rename workspace ${first} to temporary; rename workspace ${second} to ${first}; rename workspace temporary to ${second}"
