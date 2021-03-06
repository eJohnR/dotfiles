# Breaking my config files into topics/areas
# was inspired by @holman's dotfiles: github.com/holman/dotfiles
export ZSH=$HOME/.dotfiles

# .zsh file
typeset -U config_files
config_files=($ZSH/**/*.zsh)

# load .zsh file
for file in ${config_files}
do
  source $file
done

autoload -U compinit
compinit

export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE

setopt VI
setopt NO_HUP
setopt NO_LIST_BEEP
setopt COMPLETE_IN_WORD
setopt AUTOCD

setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

PATH=$PATH:$HOME/.rvm/bin  # Add RVM to PATH for scripting
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:/usr/local/sbin # Homebrew
