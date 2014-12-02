PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:$PATH
PATH=$PATH:/opt/local/dse-2.2.1/bin:/opt/local/opscenter-2.1.2/bin
PATH=$PATH:$HOME/Library/Python/2.7/bin:/usr/local/share/npm/bin
PATH=$PATH:/Applications/VMware\ Fusion.app/Contents/Library:/Applications/VirtualBox.app/Contents/MacOS

export MANPATH=/usr/local/man:/opt/local/man:$MANPATH

export RUBY_CONFIGURE_OPTS="--without-gcc --disable-install-rdoc"

export EDITOR="vim"
export HOMEBREW_EDITOR="vim"
export GEM_EDITOR="vim"
export BUNDLER_EDITOR="vim"

export DSE_HOME="/opt/local/dse-2.2.1"
export DOCKER_HOST="tcp://"

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
alias gentags="ctags -R --exclude=.git --exclude=log * "

alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

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

alias nova-dist="nova --os-tenant-name IPT-coresvcs"
alias nova-cpi="nova --os-tenant-name CPI"

export AWS_CREDENTIALS_FILE=~/.aws-credentials
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

export SONAR_RUNNER_HOME=/usr/local/opt/sonar-runner/libexec

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

export HADOOP_HOME=/usr/local/opt/hadoop/libexec
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native

# export VAGRANT_DEFAULT_PROVIDER="vmware_fusion"
export VAGRANT_DEFAULT_PROVIDER="virtualbox"

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

function set_java6() {
  export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
}

function set_java7() {
  export JAVA_HOME=`/usr/libexec/java_home -v 1.7.0`
}

function set_java8() {
  export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
}

function start_cassandra() {
  set_java7
  cassandra -f
}

function start_dse() {
  set_java6
  /opt/local/dse-2.2.1/bin/dse cassandra -f
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

source ~/.dotfiles/zshlocal

set_java8

