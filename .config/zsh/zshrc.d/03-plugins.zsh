# Powerlevel10k instant prompt
[[ ! -r $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh ]] ||
	source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Znap plugin manager

(){
	local -a plugins=(
		romkatv/powerlevel10k
		marlonrichert/zsh-autocomplete
		marlonrichert/zcolors
		zsh-users/zsh-autosuggestions
		zdharma-continuum/fast-syntax-highlighting
		marlonrichert/zsh-edit
	)

	znap clone $plugins

	local p=
	for p in $plugins; do
		znap source $p
	done
}

# Syntax Highlighting
fast-theme -s | grep -Foqm1 elegance ||
	fast-theme -q XDG:elegance

# Z Colors
znap eval zcolors zcolors

# Completion
zstyle ':completion:*:paths' path-completion yes

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# Powerlevel10k
[[ ! -r $ZDOTDIR/.p10k.zsh ]] ||
	source $ZDOTDIR/.p10k.zsh
