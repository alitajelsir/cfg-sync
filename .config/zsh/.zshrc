# Plugins
source $ZDOTDIR/.zplugins

# Directories
setopt AUTO_CD AUTO_PUSHD
setopt CD_SILENT PUSHD_IGNORE_DUPS PUSHD_MINUS PUSHD_SILENT PUSHD_TO_HOME
autoload -Uz add-zsh-hook
DIRSTACKFILE=$XDG_CACHE_HOME/zsh/dirs
[ -f "$DIRSTACKFILE" ] && (( ${#dirstack} == 0 )) &&
	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
chpwd_dirstack() {
	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack
DIRSTACKSIZE='20'

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion::complete:*' use-cache 1
setopt AUTO_LIST AUTO_MENU COMPLETE_IN_WORD GLOB_COMPLETE
znap source zsh-users/zsh-completions

# Expansion and Globbing
setopt GLOB_DOTS

# History
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=11000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE HIST_NO_FUNCTIONS HIST_NO_STORE HIST_REDUCE_BLANKS
setopt HIST_VERIFY SHARE_HISTORY
unsetopt EXTENDED_HISTORY

# Input and Output
setopt CORRECT INTERACTIVE_COMMENTS

# Help command
autoload -Uz run-help

# Aliases and Functions
source $ZDOTDIR/.zaliases
