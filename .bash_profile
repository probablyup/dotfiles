alias cleanse="git branch --merged | grep -Ev 'master|\*' | xargs git branch -D"
alias ll="ls -fHal"
alias vcd="cd ~/code"

export PS1="\[\033[38;5;154m\]\u\[$(tput sgr0)\]\[\033[38;5;155m\] \[$(tput sgr0)\]\[\033[38;5;156m\]\h\[$($
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
