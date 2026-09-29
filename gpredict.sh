#!/bin/bash

set -e

wget https://github.com/csete/gpredict/releases/download/v2.6/gpredict-2.6.tar.bz2
tar xvf gpredict-2.6.tar.bz2
cd gpredict-2.6

sudo apt install -y libtool intltool autoconf automake libcurl4-openssl-dev
sudo apt install -y pkg-config libglib2.0-dev libgtk-3-dev

./configure
make
sudo make install

rm -r gpredict*

mkdir -p ~/.config/autostart
cd ~/.config/autostart
cat <<EOF > gpredict.desktop
[Desktop Entry]
Type=Application
Exec=gpredict --fullscreen
EOF

echo "Done."
