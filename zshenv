PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH
PATH=$PATH:/opt/local/dse-2.2.1/bin:/opt/local/opscenter-2.1.2/bin
PATH=$PATH:$HOME/Library/Python/2.7/bin:/usr/local/share/npm/bin

export MANPATH=/usr/local/man:/opt/local/man:$MANPATH

export EDITOR="vim"
export HOMEBREW_EDITOR="vim"
export GEM_EDITOR="vim"
export BUNDLER_EDITOR="vim"

# Bundle aliases
alias be='bundle exec'
alias bec='echo "Two turntables and a microphone"; be cucumber'
alias ber='be rspec --color'
alias beg='be guard'
alias bei='be irb'
alias gsb='for k in `git branch|perl -pe "s/^..//"`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'

alias z="zeus"
alias ztr="z test spec"
alias zc="z cucumber"

alias vi="/usr/local/bin/vim"
alias animals="curl -s http://animals.ivolo.me/"
alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias pull="git branch | grep \"*\" | sed \"s/* //\" | xargs -I '{}' git pull origin '{}':'{}' && fact"
alias push="git branch | grep \"*\" | sed \"s/* //\" | xargs -I '{}' git push origin '{}':'{}' && fact"
alias fetch="echo 'Good boy! Go get those branches!' && git fetch --all -p && animals"
alias brewhome="cd `brew --prefix`"
alias dev="cd ~/Documents/Dev"

alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

alias drizzle_start="drizzled --no-defaults --mysql-protocol.port=3307 --datadir=/usr/local/var/drizzle/ >> /usr/local/var/drizzle/drizzle.err 2>&1 &"
alias redis_start="redis-server /usr/local/etc/redis.conf"
alias selenium_start="java -jar /usr/local/opt/selenium-server-standalone/selenium-server-standalone-.jar -p 4444"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias mongo_start="mongod run --config /usr/local/etc/mongod.conf"

export AWS_CREDENTIALS_FILE=~/.aws-credentials
unsetopt auto_name_dirs

source ~/.dotfiles/zshlocal

# RVM
 export rvm_project_rvmrc=1
# PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
