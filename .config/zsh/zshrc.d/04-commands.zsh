() {
	local -a commands=(
		aria2c="aria2c --dir $HOME/Downloads"
		bh='col -bx | bat -pl help --theme=Monokai\ Extended'
		cfg="git --git-dir $XDG_CONFIG_HOME/cfg-sync --work-tree $HOME"
		cp='cp -iv'
		exa='exa -aFb --icons --group-directories-first'
		fd='fd -u'
		ffmpeg='ffmpeg -hide_banner'
		ffprobe='ffprobe -hide_banner'
		grep='grep --color=auto'
		help=run-help
		qsenc='ffmpeg -init_hw_device qsv=hw -filter_hw_device hw'
		kudl="ydl -o '%(playlist)s/%(chapter_number)02d-%(chapter)s/%(playlist_index)02d-%(title)s.%(ext)s'"
		ls=exa
		mv='mv -iv'
		pvc='protonvpn-cli c -f'
		pvd='protonvpn-cli d'
		pvs='protonvpn-cli s'
		rm='rm -Iv'
		rsync='rsync -hP'
		sudo='sudo '
		ydl=yt-dlp
		ydla='ydl -x -f ba/b'
	)
	alias $commands
}
alias -g '$= '

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
