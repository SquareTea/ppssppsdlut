#!/bin/bash
pipx install clickable-ut
echo 'export PATH="$PATH:$HOME/.local/bin"' >> ~/.bashrc
source ~/.bashrc
git clone --recurse-submodules https://github.com/SquareTea/ppsspp --depth 1
sudo systemctl start docker
sudo usermod -a -G docker runner
cd ppsspp
sudo chmod +x b.sh
./b.sh --utarm64
cd ../
cp -rf ppsspp/build/assets assets
cp -rf ppsspp/build/PPSSPPSDL PPSSPPSDL
newgrp docker
export ARCH=arm64
clickable build --arch=arm64
