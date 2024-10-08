# Configure additional Key bindings
# Bind Tab to menu selection
bindkey '^I' menu-select

# Restore up and down arrow keys behavior
bindkey '^[[A' .up-line-or-history
bindkey '^[[B' .down-line-or-history

# Bind Alt+v to key description
bindkey '^[v' describe-key-briefly

# Bind Alt+w to widget key association
bindkey '^[w' where-is

# Bind Alt+shift+s to prefix with sudo
() {
  bindkey '^[S' $1
  zle -N $1
  $1() {
    [[ $BUFFER == [[:space:]]# ]] &&
      zle .up-history

    LBUFFER=" sudo $LBUFFER"
  }
} .sudo
