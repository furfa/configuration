# !/bin/bash

layout=$(ls ~/.screenlayout | rofi -dmenu)
/bin/bash ~/.screenlayout/$layout
