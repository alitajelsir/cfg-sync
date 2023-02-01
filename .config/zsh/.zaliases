alias -g '$= '
alias aria2c="aria2c --dir $HOME/Downloads"
alias bh='col -bx | bat -pl help --theme=Monokai\ Extended'
alias cfg="git --git-dir $HOME/.config/cfg-sync --work-tree $HOME"
alias cp='cp -iv'
alias exa='exa -aFb --icons --group-directories-first'
alias fd='fd -u'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias grep='grep --color=auto'
alias help=run-help
alias qsenc='ffmpeg -init_hw_device qsv=hw -filter_hw_device hw'
alias kudl="ydl -o '%(playlist)s/%(chapter_number)02d-%(chapter)s/%(playlist_index)02d-%(title)s.%(ext)s'"
alias ls=exa
alias mv='mv -iv'
alias pvc='protonvpn-cli c --cc US'
alias pvd='protonvpn-cli d'
alias pvs='protonvpn-cli s'
alias rm='rm -Iv'
alias rsync='rsync -hP'
alias sudo='sudo '
alias ydl=yt-dlp
alias ydla="ydl -x -f ba/b"

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

# Trap SIGUSR1 and rehash
TRAPUSR1() { rehash }
