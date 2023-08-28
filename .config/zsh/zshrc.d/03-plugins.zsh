# Powerlevel10k instant prompt
[[ -r $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh ]] &&
	source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Znap plugin manager

(){
	local -a plugins=(
		zdharma-continuum/fast-syntax-highlighting
		zsh-users/zsh-autosuggestions
		marlonrichert/zcolors
		kutsan/zsh-system-clipboard
		softmoth/zsh-vim-mode
		zsh-users/zsh-completions
		marlonrichert/zsh-autocomplete
		romkatv/powerlevel10k
	)

	znap clone $plugins

	local p=
	for p in $plugins; do
		znap source $p
	done
}

# Syntax Highlighting
fast-theme -s | grep -Foqm1 elegance || fast-theme -q XDG:elegance

# Z Colors
znap eval zcolors zcolors

# Vim Mode
MODE_CURSOR_VIINS="bar"
MODE_CURSOR_VISUAL="block"

# Completion
zstyle ':completion:*:paths' path-completion yes
zstyle ':autocomplete:history-search-backward:*' list-lines HISTSIZE

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# Powerlevel10k
[[ -r $ZDOTDIR/.p10k.zsh ]] && source $ZDOTDIR/.p10k.zsh
