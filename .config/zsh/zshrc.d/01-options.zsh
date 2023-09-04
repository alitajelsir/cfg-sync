# Configure options
() {
	# List options	
	local -a options=(
		# Expansion and Globbing
		EXTENDED_GLOB
		GLOB_DOTS
		GLOB_STAR_SHORT
		NUMERIC_GLOB_SORT
		# History
		HIST_FCNTL_LOCK
		HIST_IGNORE_ALL_DUPS
		HIST_IGNORE_SPACE
		HIST_NO_FUNCTIONS
		HIST_NO_STORE
		HIST_REDUCE_BLANKS
		HIST_VERIFY
		INC_APPEND_HISTORY
		# Input and Output
		CORRECT
		INTERACTIVE_COMMENTS
	)
	# Set options
	setopt $options
}
# No timestamps in history
unsetopt EXTENDED_HISTORY

# History File
HISTFILE=$ZDOTDIR/.zhistory
SAVEHIST=1000
HISTSIZE=$(( 1.2 * SAVEHIST ))

# Help command
unalias run-help
autoload -Uz run-help

# Emacs mode
bindkey -e

# Cursor
printf '\e[6 q'
