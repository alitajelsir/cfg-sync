# Install plugins
() {

	# List plugins
	local -a plugins=(
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
