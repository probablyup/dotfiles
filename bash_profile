export PS1="\[\033[38;5;154m\]\u\[$(tput sgr0)\]\[\033[38;5;155m\] \[$(tput sgr0)\]\[\033[38;5;156m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;158m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;87m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

alias ll="ls -fHal"
alias vcd="cd ~/code"

# Compare local git branches to upstream and remove ones here that aren't there
# ** Useful if you delete a branch in the git GUI
alias cleanse='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Sync with upstream, but doesn't push to origin (good if you have a repo cloned but not forked)
alias upsync='git checkout master && git clean -f -d && git checkout . && git fetch upstream && git merge upstream/master'

# Get the latest updates from upstream, push them into your forked master branch,
# then use that clean base to create a new branch with the name of your choice
# eg. makebranch foo
makeBranchFunc(){
    git checkout .
    git clean -f -d
    git checkout master
    git fetch upstream
    git merge upstream/master
    git push
    git branch $1
    git checkout $1
    git push --set-upstream origin $1
}
alias makebranch=makeBranchFunc

# This is good to have if you use Homebrew
export PATH=/usr/local/bin:$PATH

# Fixes Karma using an older version when >2 is installed by Homebrew
export PHANTOMJS_BIN=/usr/local/bin/phantomjs
