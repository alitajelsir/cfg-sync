# Install plugins
() {

	# List plugins
	local -a _plugins=(
		zdharma-continuum/fast-syntax-highlighting
		marlonrichert/zcolors
		zsh-users/zsh-autosuggestions
		marlonrichert/zsh-autocomplete
		marlonrichert/zsh-edit
	)

	# Clone plugins in parallel
	znap clone $_plugins

	# Source plugins one by one
	local _p=
	for _p in $_plugins; do
		znap source $_p
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

# Set recent directories file
zstyle ':chpwd:*' recent-dirs-file $XDG_CACHE_HOME/zsh/chpwd-recent-dirs
