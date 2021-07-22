#!/usr/bin/python
import i3ipc
from rofi import Rofi

scr_windows = list()
i3 = i3ipc.Connection()

tree = i3.get_tree()

for leaf in tree.scratchpad().leaves():
    scr_windows.append(leaf.window_class)

r = Rofi()
index, key = r.select('window', scr_windows)

if key != 0:
    exit(0)

selected = scr_windows[index]

window = tree.find_classed(selected)[0]

window.command("focus")
window.command("move position center")
