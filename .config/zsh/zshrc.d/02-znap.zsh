() {
	local znap_remote znap_local
		znap_remote=https://github.com/marlonrichert/zsh-snap.git
		znap_local=$XDG_DATA_HOME/znap/zsh-snap
	
	[[ -r $znap_local/znap.zsh ]] || git clone --depth 1 $znap_remote $znap_local
	source $znap_local/znap.zsh
}
