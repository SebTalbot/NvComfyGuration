#!/bin/bash
install_configs () {
  rm -rf ~/.cache/nvim
  rm -rf ~/.config/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim

  mkdir ~/.config/nvim
  ln -sf $(pwd)/init.lua ~/.config/nvim/init.lua
  ln -sf $(pwd)/lua ~/.config/nvim/lua
  ln -sf $(pwd)/after ~/.config/nvim/after
  nvim
}

if test -d "$HOME/.config/nvim"; then
  echo "This script will remove your current neovim configurations and cache. Do you want to continue? y/n"
  read input
  if test $input == "y"; then
    install_configs
  else
    echo "Install aborted"
  fi
else
  install_configs
fi

