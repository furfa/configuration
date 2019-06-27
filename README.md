# configuration

#### to install
```bash
stow {folder name}
```

#### to install gksudo on ubuntu 18.10

```bash
wget http://mirrors.kernel.org/ubuntu/pool/universe/libg/libgksu/libgksu2-0_2.0.13~pre1-9ubuntu2_amd64.deb
sudo apt install ./libgksu2-0_2.0.13~pre1-9ubuntu2_amd64.deb

wget http://mirrors.kernel.org/ubuntu/pool/universe/g/gksu/gksu_2.0.2-9ubuntu1_amd64.deb
sudo apt install ./gksu_2.0.2-9ubuntu1_amd64.deb
```

#### to install Fira Code

```bash

mkdir -p ~/.local/share/fonts
touch download.sh
for type in Bold Light Medium Regular Retina; do
    wget -O ~/.local/share/fonts/FiraCode-${type}.ttf \
    "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
done
fc-cache -f


```
