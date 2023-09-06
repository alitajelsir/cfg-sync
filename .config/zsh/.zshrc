# Split .zshrc into multiple files in zshrc.d
() {
	local zshrc=
	for zshrc in $ZDOTDIR/zshrc.d/<->-*.zsh(n); do
		source $zshrc
	done
}
