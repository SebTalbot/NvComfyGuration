#!/bin/bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim

mkdir ~/.config/nvim
ln -sf $(pwd)/init.lua ~/.config/nvim/init.lua
ln -sf $(pwd)/lua ~/.config/nvim/lua

nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
