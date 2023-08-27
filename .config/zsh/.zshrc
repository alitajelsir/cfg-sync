() {
	local zshrc=
	for zshrc in $ZDOTDIR/zshrc.d/<->-*.zsh(n); do
		source $zshrc
	done
}
