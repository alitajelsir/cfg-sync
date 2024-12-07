# Unless running interactively, don't do anything
[[ $- == *i* ]] ||
	return

# Split .zshrc into multiple files in zshrc.d
() {
	local _zshrc=
	for _zshrc in $ZDOTDIR/zshrc.d/<->-*.zsh(n); do
		source $_zshrc
	done
}
