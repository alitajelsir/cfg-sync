# Use znap to mange plugins
# Set znap options
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
