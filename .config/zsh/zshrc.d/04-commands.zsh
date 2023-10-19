# Configure aliases
() {

	# List aliases
	local -a commands=(
		%= \$= ❯=
		-='cd -'
		aria2c="aria2c --dir $HOME/Downloads"
		bh='col -bx | bat -pl help --theme=Monokai\ Extended'
		cfg="git --git-dir $XDG_CONFIG_HOME/cfg-sync --work-tree $HOME"
		cp='cp -iv'
		eza='eza -abF --icons --group-directories-first'
		fd='fd -u'
		ffmpeg='ffmpeg -hide_banner'
		ffprobe='ffprobe -hide_banner'
		grep='grep --color=auto'
		help=run-help
		ls='ls -AFhv --color=auto --group-directories-first'
		mv='mv -iv'
		plg="cd $(mktemp -d)"
		pvc='protonvpn-cli c -f'
		pvd='protonvpn-cli d'
		pvs='protonvpn-cli s'
		qsenc='ffmpeg -init_hw_device qsv=hw -filter_hw_device hw'
		rm='rm -Iv'
		rsync='rsync -hP'
		sudo='sudo '
		ydl=yt-dlp
		ydla='yt-dlp -x -f ba/b'
	)

	# Set aliases
	alias -- $commands
}

# Set global aliases
alias -g '$= '
