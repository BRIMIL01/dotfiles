#! /usr/bin/env bash

ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zshenv ~/.zshenv
ln -s ~/.dotfiles/irbrc ~/.irbrc
ln -s ~/.dotfiles/pryrc ~/.pryrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
./Brewfile



