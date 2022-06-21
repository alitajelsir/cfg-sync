# Powerlevel10k instant prompt
[ -r $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh ] ||
	source $XDG_CACHE_HOME/.cache/p10k-instant-prompt-${(%):-%n}.zsh

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
DIRSTACKSIZE='10'

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion::complete:*' use-cache 1
setopt AUTO_LIST AUTO_MENU COMPLETE_IN_WORD GLOB_COMPLETE
znap source zsh-users/zsh-completions

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
setopt CORRECT INTERACTIVE_COMMENTS

# Trap SIGUSR1 and rehash
trap 'rehash' USR1

# Autosuggestion
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
znap source zsh-users/zsh-autosuggestions

# Syntax Highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_PATTERNS
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=216' 'sudo' 'fg=216')
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

# System clipboard 
znap source kutsan/zsh-system-clipboard 

# Powerlevel10k
[ ! -f $ZDOTDIR/.p10k.zsh ] || source $ZDOTDIR/.p10k.zsh
znap source romkatv/powerlevel10k

# Command not found handler
command_not_found_handler() {
	local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
	printf 'zsh: command not found: %s\n' "$1"
	local entries=(
		${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"}
	)
	if (( ${#entries[@]} )); then
		printf "${bright}$1${reset} may be found in the following package(s):\n"
		local pkg
		for entry in "${entries[@]}"
		do
			local fields=(
				${(0)entry}
			)
			if [[ "$pkg" != "${fields[2]}" ]]; then
				printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
			fi
			printf '    /%s\n' "${fields[4]}"
			pkg="${fields[2]}"
		done
	fi 1>&2
	return 127
}

# Aliases
alias -g '$= '
alias aria2c="aria2c --dir $HOME/Downloads"
alias cfg="git --git-dir $HOME/.config/cfg-sync --work-tree $HOME"
alias cp='cp -iv'
alias exa='exa -aFb --icons --group-directories-first'
alias fd='fd -HI'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias hwenc='ffmpeg -vaapi_device /dev/dri/renderD128'
alias kudl="ydl -o '%(playlist)s/%(chapter_number)02d-%(chapter)s/%(playlist_index)02d-%(title)s.%(ext)s'"
alias ls=exa
alias mv='mv -iv'
alias oh='col -bx | bat -l man --theme Monokai\ Extended -p'
alias pvc='protonvpn-cli c --cc US'
alias pvd='protonvpn-cli d'
alias pvs='protonvpn-cli s'
alias rm='rm -Iv'
alias rsync='rsync -hP'
alias sudo='sudo '
alias ydl=yt-dlp
alias ydla="ydl -P $HOME/Audio/YouTube -x -f ba/b"
alias zup='znap pull'
