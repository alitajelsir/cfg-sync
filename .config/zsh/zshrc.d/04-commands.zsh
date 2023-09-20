# Configure aliases
() {

	# List aliases
	local -a commands=(
		%=
		-='cd -'
		\$=
		bh='col -bx | bat -pl help --theme=Monokai\ Extended'
		cfg="git --git-dir $XDG_CONFIG_HOME/cfg-sync/ --work-tree $HOME"
		cget=termux-clipboard-get
		cp='cp -iv'
		cset=termux-clipboard-set
		exa='exa -abF --group-directories-first --icons'
		fd='fd -uL'
		ffmpeg='ffmpeg -hide_banner'
		ffprobe='ffprobe -hide_banner'
		grep='grep --color=auto'
		kudl="ydl -o '%(playlist)s/%(chapter_number)02d-%(chapter)s/%(playlist_index)02d-%(title)s.%(ext)s'"
		ls='ls -AFhv --color=auto --group-directories-first'
		mv='mv -iv'
		open=termux-open
		plg="cd $(mktemp -d)"
		rm='rm -Iv'
		rsync='rsync -hP'
		vi=nvim
		ydl=yt-dlp
		ydla='yt-dlp -x -f ba/b'
	)

	# Set aliases
	alias -- $commands
}


# Configure functions
# Update python packages
pup() {
	pip install --user -U $(pip list --user -o | awk 'NR>2 {print $1}')
}

# Colorize manpages
man() {
	command man "$@" | col -bx | bat -pl man --theme=Monokai\ Extended
}
