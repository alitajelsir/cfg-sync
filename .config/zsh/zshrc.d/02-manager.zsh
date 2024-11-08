# Use znap to mange plugins
# Set znap options
# Disable znap asynchronous compilation
zstyle ':znap:*' auto-compile no

# Disable znap git maintenance
zstyle ':znap:*:*' git-maintenance off

# Set znap local and remote sources
() {
	local _znap_local _znap_remote
		_znap_local=$XDG_DATA_HOME/zsh/plugins/zsh-snap
		_znap_remote=https://github.com/marlonrichert/zsh-snap.git

# Install znap
	[[ -r $_znap_local/znap.zsh ]] ||
		git clone --depth 1 $_znap_remote $_znap_local
	source $_znap_local/znap.zsh
}
