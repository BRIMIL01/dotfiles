PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH
PATH=$PATH:/opt/local/dse-2.2.1/bin:/opt/local/opscenter-2.1.2/bin
PATH=$PATH:$HOME/Library/Python/2.7/bin:/usr/local/share/npm/bin:$HOME/.jenv/bin
PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Library:/Applications/VirtualBox.app/Contents/MacOS
PATH=$PATH:/opt/spark-1.6.0/bin:/opt/spark-1.6.0/sbin

export RBENV_ROOT=/usr/local/var/rbenv
export PYENV_ROOT=/usr/local/var/pyenv
export NVM_DIR="/Users/brian.miller/.nvm"

export MANPATH=/usr/local/man:/opt/local/man:/usr/local/opt/erlang/lib/erlang/man:$MANPATH

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# export RUBY_CONFIGURE_OPTS="--without-gcc --disable-install-rdoc --with-readline-dir=`brew --prefix readline`"

export EDITOR="vim"
export HOMEBREW_EDITOR="vim"
export GEM_EDITOR="vim"
export BUNDLER_EDITOR="vim"

# Bundle aliases
alias be='bundle exec'
alias bec='echo "Two turntables and a microphone"; be cucumber'
alias ber='be rspec --color'
alias berd='ber -f d'
alias besr='be spring rspec --color'
alias bei='be irb'
alias gsb='for k in `git branch|perl -pe "s/^..//"`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'

alias fact="elinks -dump randomfunfacts.com | sed -n '/^| /p' | tr -d \|"
alias pull="git branch | grep \"*\" | sed \"s/* //\" | xargs -I '{}' git pull origin '{}':'{}' && fact"
alias push="git branch | grep \"*\" | sed \"s/* //\" | xargs -I '{}' git push origin '{}':'{}' && fact"
alias fetch="echo 'Good boy! Go get those branches!' && git fetch --all --tags -p"
alias gs='git status'
alias gd='git diff'
alias brewhome="cd `brew --prefix`"
alias dev="cd ~/code"
alias gentags="ctags -R --exclude=.git --exclude=log * "
alias ff="fzf --preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || rougify {} || cat {}) 2> /dev/null'"


#alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

alias h="hadoop"
alias hf="hadoop fs"
alias hfls="hadoop fs -ls"

alias drizzle_start="drizzled --no-defaults --mysql-protocol.port=3307 --datadir=/usr/local/var/drizzle/ >> /usr/local/var/drizzle/drizzle.err 2>&1 &"
alias redis_start="redis-server /usr/local/etc/redis.conf"
alias selenium_start="java -jar /usr/local/opt/selenium-server-standalone/selenium-server-standalone-.jar -p 4444"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias mongo_start="mongod run --config /usr/local/etc/mongod.conf"
alias jenkins="java -jar /usr/local/opt/jenkins/libexec/jenkins.war"
alias sonar_start="/usr/local/opt/sonar/bin/sonar console"

export AWS_CREDENTIALS_FILE=~/.aws-credentials

export HADOOP_HOME=/usr/local/opt/hadoop/libexec
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HIVE_HOME=/usr/local/Cellar/hive/1.2.1/libexec
export HCAT_HOME=/usr/local/Cellar/hive/1.2.1/libexec/hcatalog
export AKKA_HOME=/usr/local/Cellar/akka/2.3.9/libexec

# export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"
export VAGRANT_DEFAULT_PROVIDER="virtualbox"
export ASDF_GOLANG_MOD_VERSION_ENABLED=true
export DOCKER_DEFAULT_PLATFORM=linux/amd64


unsetopt auto_name_dirs

function psgrep() { ps axu | grep -v grep | grep "$@" -i --color=auto; }

function test_for_pull() {
  prev_tests="$1"
  cukes=`be cucumber 2>&1 | tail -n 3`
  echo "Cucumber\n$cukes\n\n"
  specs=`be rspec 2>&1 | grep -ve "^[.*F][.*F]" | tail -n 4`
  echo "Specs\n$specs\n"
  echo "$prev_tests\nCucumber\n\n\`\`\`\n$cukes\n\`\`\`\n\nSpecs\n\n\`\`\`\n$specs\n\`\`\`\n" | pbcopy
}

function test_capture_for_pull() {
  jasmine=`snapdragon spec/assets/javascripts`
  echo "Jasmine\n$jasmine\n"
  test_for_pull "Jasmine\n\n\`\`\`\n$jasmine\n\`\`\`\n"
}

function build_changelog() {
  git log --oneline --no-merges $1..$2 | cut -d " " -f 2- | pbcopy
}

function cow_norris() {
  curl -s http://api.icndb.com/jokes/random | ruby -e "require 'json'; require 'cgi'; puts \"http://cowsay.morecode.org/say?format=text&message=#{CGI.escape(JSON.parse(gets)['value']['joke'])}\"" | xargs curl
}

function start_kafka() {
  kafka-server-start /usr/local/etc/kafka/server.properties
}

# https://coderwall.com/p/gxtehg/bundle-grep-1
function bung () {
  ag "$@" `bundle show --paths`
}

dcleanup(){
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}

dnuke() {
  docker rm -v $(docker ps -aq)
  docker rmi -f $(docker images -q)
  docker volume rm $(docker volume ls -q)
}

source ~/.zshlocal

