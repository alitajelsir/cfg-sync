# Use znap to mange plugins
# Disable znap asynchronous compilation
zstyle ':znap:*' auto-compile no

# Disable znap git maintenance
zstyle ':znap:*:*' git-maintenance off

# Set znap local and remote sources
() {
	local znap_local znap_remote
		znap_local=$XDG_DATA_HOME/zsh/plugins/zsh-snap
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
# Set syntax highlighting theme
fast-theme -s | grep -Foqm1 elegance ||
	fast-theme -q XDG:elegance

# Cache zcolor output
znap eval zcolors zcolors

# Set completers
zstyle ':completion:*' completer _extensions _complete _complete:-fuzzy _correct _approximate _ignored
