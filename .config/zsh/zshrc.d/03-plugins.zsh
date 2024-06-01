# Use znap to mange plugins
# Set znap local and remote sources
() {
	local znap_local znap_remote
		znap_local=$XDG_DATA_HOME/znap/zsh-snap
		znap_remote=https://github.com/marlonrichert/zsh-snap.git

# Install znap
	[[ -r $znap_local/znap.zsh ]] ||
		git clone --depth 1 $znap_remote $znap_local
	source $znap_local/znap.zsh
}


# Install plugins
() {

	# List plugins
	local -a plugins=(
		romkatv/powerlevel10k
		zdharma-continuum/fast-syntax-highlighting
		marlonrichert/zcolors
		zsh-users/zsh-autosuggestions
		marlonrichert/zsh-autocomplete
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

# Bind Tab to menu selection
bindkey '^I' menu-select

# Restore up and down arrow keys behavior
bindkey '^[[A' .up-line-or-history
bindkey '^[[B' .down-line-or-history

# Cache zcolor output
znap eval zcolors zcolors

# Set syntax highlighting theme
fast-theme -s | grep -Foqm1 elegance ||
	fast-theme -q XDG:elegance
