autoload colors && colors

# Display Current Git Branch
autoload -Uz vcs_info
setopt promptsubst
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git*' formats "%{$fg[black]%}[%{$reset_color%}%{$fg[yellow]%}%b%{$reset_color%}%{$fg[black]%}]%{$reset_color%}"

# Format Prompt
export PROMPT='%{$fg[red]%}%n%{$reset_color%} at %{$fg[cyan]%}%m%{$reset_color%} in %{$fg[green]%}%1~%{$reset_color%} on ${vcs_info_msg_0_}
> '

precmd() {vcs_info}
