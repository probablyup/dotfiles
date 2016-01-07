alias ll="ls -fHal"
alias vcd="cd ~/code"

export PS1="\[\033[38;5;154m\]\u\[$(tput sgr0)\]\[\033[38;5;155m\] \[$(tput sgr0)\]\[\033[38;5;156m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;158m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;87m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Compare local git branches to upstream and remove ones here that aren't there
# ** Useful if you delete a branch in the git GUI
alias cleanse='git branch --merged | grep -v "\*" | grep -v 'master' | xargs -n 1 git branch -d'

# Get the latest updates from upstream, push them into your forked master branch,
# then use that clean base to create a new branch with the name of your choice
# eg. makebranch foo 
makeBranchFunc() {
    git checkout master
    git clean -f -d
    git pull
    git branch $1
    git checkout $1
    git push --set-upstream origin $1
}
alias makebranch=makeBranchFunc

changelogFunc() {
    git log --pretty=format:"%s (%h)" $1..$2
}
alias changelog=changelogFunc

# This is good to have if you use Homebrew
export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
