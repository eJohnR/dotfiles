autoload colors && colors

# Display Current Git Branch
autoload -Uz vcs_info
setopt promptsubst
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:git*' formats "on %{$fg[red]%}[%{$reset_color%}%{$fg[white]%}%b%{$reset_color%}%{$fg[red]%}]%{$reset_color%}" "%{$fg[cyan]%}%c%{$reset_color%}%{$fg[red]%}%u%{$reset_color%}"

# Format Prompt
export PROMPT="%{$fg[green]%}%2~%{$reset_color%} \${vcs_info_msg_0_}
> "

export RPROMPT="\${vcs_info_msg_1_}"

precmd() {vcs_info}
