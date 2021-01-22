#! /bin/python

#%%
import subprocess
from urllib.parse import quote, unquote

#%%
files_str = subprocess.check_output(["dragon-drag-and-drop", "-t", "-x"])
files_str = str(files_str, "utf-8")
files = files_str.split()
# print(files)
#%%

for file in files:
    path = file.strip("\n")
    path = unquote(path)

    if path.startswith("file:///"):
        
        name = path.split("/")[-1]
        
        # change_name = input("Change file name ? ")
        # if change_name == "y":
        #     name = input("Enter name: ")    
        
        subprocess.run(["cp", "-r", path[7:], name])
#    elif path.startswith("https"):
#        name = input("Enter name: ") 
#        
#        subprocess.run(["curl", path, "-o", name])
