# Powerlevel10k instant prompt
[ -r $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh ] &&
	source $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

# Znap plugin manager
[ -f $XDG_DATA_HOME/znap/zsh-snap/znap.zsh ] ||
	git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git $XDG_DATA_HOME/znap/zsh-snap
source $XDG_DATA_HOME/znap/zsh-snap/znap.zsh

# Completion
znap source zsh-users/zsh-completions

# Syntax Highlighting
znap source zdharma-continuum/fast-syntax-highlighting
fast-theme -s | grep -Foqm1 elegance || fast-theme -q XDG:elegance

# Autosuggestion
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
znap source zsh-users/zsh-autosuggestions

# Z Colors
znap source marlonrichert/zcolors
znap eval zcolors zcolors

# History Substring Search
znap source zsh-users/zsh-history-substring-search

# Vim Mode
MODE_CURSOR_VIINS="bar"
MODE_CURSOR_REPLACE="underline"
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="underline"
MODE_CURSOR_VISUAL="block"
MODE_CURSOR_VLINE="block"
znap source softmoth/zsh-vim-mode

# System Clipboard
znap source kutsan/zsh-system-clipboard

# Powerlevel10k
[ -f $ZDOTDIR/.p10k.zsh ] && source $ZDOTDIR/.p10k.zsh
znap source romkatv/powerlevel10k
