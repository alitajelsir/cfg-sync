# configure prompt
# Use instant prompt
[[ ! -r $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh ]] ||
	source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Set prompt theme
[[ ! -r $ZDOTDIR/.p10k.zsh ]] ||
	source $ZDOTDIR/.p10k.zsh

# Set cursor shape to bar
_cursor_bar() { printf '\e[6 q' }
precmd_functions+=(_cursor_bar)


# Install plugins
() {

	# List plugins
	local -a plugins=(
		romkatv/powerlevel10k
		marlonrichert/zsh-autocomplete
		marlonrichert/zcolors
		zsh-users/zsh-autosuggestions
		zdharma-continuum/fast-syntax-highlighting
		marlonrichert/zsh-edit
	)

	# Clone plugins in parallel
	znap clone $plugins

	# Source plugins one by one
	local p=
	for p in $plugins; do
		znap source $p
	done
}


# Configure plugins
# Allow path completion
zstyle ':completion:*:paths' path-completion yes

# Disable grouping matches
zstyle ':completion:*' list-grouped no

# Cache zcolor output
znap eval zcolors zcolors

# Set syntax highlighting theme
fast-theme -s | grep -Foqm1 elegance ||
	fast-theme -q XDG:elegance
