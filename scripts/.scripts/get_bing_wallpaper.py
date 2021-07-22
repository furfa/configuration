#! /usr/bin/python
import requests
import json
from datetime import datetime
from pprint import pprint
import subprocess
import os

AUTOSET = True
WALLPAPER_DIR = "/home/furfa/bing-wallpaper"

# photo_url = "https://source.unsplash.com/random/1920x1080"
photo_url = "https://source.unsplash.com/1920x1080/?neon"
print(photo_url)

photo_req = requests.get(photo_url, allow_redirects=True)

pprint(photo_req.headers)

filename = f"{WALLPAPER_DIR}/{datetime.utcnow()}.jpeg"
with open(filename,"wb") as file:
    file.write(photo_req.content)

if AUTOSET:
    subprocess.run(["/usr/bin/feh", "--bg-fill", filename], capture_output=True)
