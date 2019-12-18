export PATH="/usr/local/sbin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

alias cleanse="git branch --merged | grep -Ev 'master|\*' | xargs git branch -D"
alias ll="ls -fHal"
alias vcd="cd ~/code"
alias unlink="npx react-native unlink"
alias ios="npm run ios-dev:start"
alias iosbeta="fastlane ios beta"
alias iosrel="fastlane ios release"
alias and="npm run android-dev:start"
alias andbeta="fastlane android beta"
alias andrel="fastlane android release"

PROMPT="%F{10}%n%f %F{34}%m%f %F{51}[%f%F{51}%d%f%F{51}]%f $ "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

changelogFunc(){
    git log --no-merges --pretty=format:"%h %s" $1..$2 | grep -v "\[skip ci\]"
}
alias changelog=changelogFunc

cloneAllFunc(){
    for branch in `git branch -a | grep remotes/origin | grep -v HEAD | grep -v master `; do
       git branch --track ${branch#remotes/origin/} $branch
    done
    git checkout master
}
alias cloneall=cloneAllFunc

# This is good to have if you use Homebrew
export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a $

# use `nvm alias default stable` to set all new terminal windows to use the most recent stable node version

export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"
