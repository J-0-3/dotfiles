#!/bin/bash

mkdir -p ~/.config
cp -r $(dirname $0)/nvim ~/.config/nvim
cp -r $(dirname $0)/ghostty ~/.config/ghostty
cp -r $(dirname $0)/foot ~/.config/foot
git clone https://aur.archlinux.org/dwl.git ~/.config/dwl
cp $(dirname $0)/dwl/config.h ~/.config/dwl
cd ~/.config/dwl
makepkg -si
