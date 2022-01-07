# Powerlevel10k instant prompt
[ -r $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh ] ||
	source $XDG_CACHE_HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh

# Znap plugin manager
[ -f $XDG_DATA_HOME/znap/zsh-snap/znap.zsh ] ||
	git clone https://github.com/marlonrichert/zsh-snap.git $XDG_DATA_HOME/znap/zsh-snap/
source $XDG_DATA_HOME/znap/zsh-snap/znap.zsh

# Directories
setopt AUTO_CD AUTO_PUSHD
setopt CD_SILENT PUSHD_IGNORE_DUPS PUSHD_MINUS PUSHD_SILENT PUSHD_TO_HOME
autoload -Uz add-zsh-hook
DIRSTACKFILE=$XDG_CACHE_HOME/zsh/dirs
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
fi
chpwd_dirstack() {
	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack
DIRSTACKSIZE='20'

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion::complete:*' use-cache 1
setopt AUTO_LIST AUTO_MENU COMPLETE_IN_WORD GLOB_COMPLETE
znap source zsh-users/zsh-completions
znap eval pip-completion "pip completion --zsh # $PYENV_VERSION"

# Expansion and Globbing
setopt GLOB_DOTS

# History
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=11000
SAVEHIST=10000
setopt HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_SPACE HIST_NO_FUNCTIONS HIST_NO_STORE HIST_REDUCE_BLANKS
setopt HIST_VERIFY SHARE_HISTORY
unsetopt EXTENDED_HISTORY

# Input and Output
setopt CORRECT

# Autosuggestion
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
znap source zsh-users/zsh-autosuggestions

# Syntax Highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=216')
znap source zsh-users/zsh-syntax-highlighting

# Z Colors
znap source marlonrichert/zcolors
znap eval zcolors zcolors
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=blue'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=green'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=cyan'

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
[ ! -f $ZDOTDIR/.p10k.zsh ] || source $ZDOTDIR/.p10k.zsh
znap source romkatv/powerlevel10k

# Aliases
alias -g '$= '
alias cfg="git --git-dir $HOME/.config/cfg-sync/ --work-tree $HOME"
alias cp='cp -iv'
alias exa='exa -aF --group-directories-first --icons -b'
alias fd='fd -HL'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias h=man
alias kl='killall -KILL'
alias kudl="ydl -o '%(playlist)s/%(chapter_number)02d-%(chapter)s/%(playlist_index)02d-%(title)s.%(ext)s'"
alias ls=exa
alias mv='mv -iv'
alias oh='col -bx | bat -l man --theme Monokai\ Extended -p'
alias open=termux-open
alias rm='rm -Iv'
alias rs='rsync -h --progress'
alias cget=termux-clipboard-get
alias cset=termux-clipboard-set
alias vi=nvim
alias ydl=yt-dlp
alias ydla='ydl -x -f ba/b'
alias zup='znap pull'
