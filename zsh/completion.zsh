# Ignore case when autocompleting
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Fuzzy matching of completions
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
