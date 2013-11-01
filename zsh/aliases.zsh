# Ctags
alias ctags="`brew --prefix`/bin/ctags"

# Git Aliases
alias gd="git diff"
alias gc="git commit"
alias gco="git checkout"
alias gsu="git status -uno"

# todo.sh Aliases
alias td="todo.sh"
alias tda="todo.sh add"
alias tdc="todo.sh do"

# pmd.sh Aliases
pmd() {
   nohup pmd.sh $* > /dev/null &
}

# punch.py Aliases
alias punch="Punch.py"
