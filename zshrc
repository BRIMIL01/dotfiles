# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras brew sublime encode64 docker 1password poetry vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Set the term to xterm at 16 colors rather than the xterm-256color mode
# which tells it to use 256 colors. It is important that terminal themes
# intended for 16 colors are used in 16 color mode and themes intended
# for 256 colors are used in 256 color mode. Otherwise, the colors won't
# look correct. This also goes for Vim color schemes.
#
# Currently I have this set to xterm in 16 color mode as I have chosen
# to use the ir_black terminal theme and ir_black vim theme which are
# both intended for 16 color mode.
# export TERM=xterm-256color

# This is necessary for the Ctrl-s keyboard shortcut to make it through to
# Vim
stty -ixon

# 1Password
eval $(op completion zsh)
source $HOME/.config/op/plugins.sh

for d in "/share/zsh-completions" "/share/zsh/zsh-site-functions";do
  brew_completion=$(brew --prefix 2>/dev/null)$d
  if [ $? -eq 0 ] && [ -d "$brew_completion" ];then
    fpath=($brew_completion $fpath)
  fi
done
autoload -U compinit
compinit

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi


if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR=~/.nvm
source /usr/local/opt/nvm/nvm.sh

# ASDF Init
if [ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ]; then
	. /opt/homebrew/opt/asdf/libexec/asdf.sh
	. $HOME/.asdf/plugins/java/set-java-home.zsh
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/bmiller/.sdkman"
[[ -s "/Users/bmiller/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/bmiller/.sdkman/bin/sdkman-init.sh"

[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
ulimit -n 100000
