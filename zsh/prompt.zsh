autoload colors && colors

# Display Current Git Branch
autoload -Uz vcs_info
setopt promptsubst
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:git*' formats "on %{$fg[red]%}[%{$reset_color%}%{$fg[white]%}%b%{$reset_color%}%{$fg[red]%}]%{$reset_color%}" "%{$fg[cyan]%}%c%{$reset_color%}%{$fg[red]%}%u%{$reset_color%}"

# Count TODOS marked as +next from todo.txt
function todo_count() {
   if $(which todo.sh &> /dev/null)
   then
      num=$(echo $(todo.sh ls $1 | wc -l))
      let todos=num-2
      if [ $todos != 0 ]
      then
         echo "$todos"
      else
         echo 0
      fi
   else
      echo ""
   fi
}

function todo_prompt() {
   local COUNT=$(todo_count $1);
   if [ $COUNT != 0 ]; then
      echo "$1: $COUNT";
   else
      echo "";
   fi
}

# Count TODOS|FIXMES|HACKS from Files in the Current Directory
function notes_count() {
  if [[ -z $1 ]]; then
    local NOTES_PATTERN="TODO|FIXME|HACK";
  else
    local NOTES_PATTERN=$1;
  fi
  grep -En "\b($NOTES_PATTERN)\b" * 2>/dev/null | wc -l | sed 's/ //g'
}

function notes_prompt() {
  local COUNT=$(notes_count $1);
  if [ $COUNT != 0 ]; then
    echo "$1: $COUNT";
  else
    echo "";
  fi
}

# Format Prompt
export PROMPT="%{$fg[green]%}%2~%{$reset_color%} \${vcs_info_msg_0_} \${vcs_info_msg_1_}
> "

# Format Right Prompt
set_prompt () {
   export RPROMPT="$(notes_prompt TODO) %{$fg_bold[yellow]%}$(notes_prompt HACK)%{$reset_color%} %{$fg_bold[red]%}$(notes_prompt FIXME)%{$reset_color%} %{$fg_bold[white]%}$(todo_prompt +next)%{$reset_color%}"
}

precmd() {
   vcs_info;
   set_prompt;
}
