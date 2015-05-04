#! /usr/bin bash

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
./Brewfile
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

ln -s ~/.dotfiles/zshrc ~/.zshrc
ln -s ~/.dotfiles/zshenv ~/.zshenv
ln -s ~/.dotfiles/irbrc ~/.irbrc
ln -s ~/.dotfiles/pryrc ~/.pryrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf


