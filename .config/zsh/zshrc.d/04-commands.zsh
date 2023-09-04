# Configure aliases
() {
	# List aliases
	local -a commands=(
		bh='col -bx | bat -pl help --theme=Monokai\ Extended'
		cfg="git --git-dir $XDG_CONFIG_HOME/cfg-sync/ --work-tree $HOME"
		cp='cp -iv'
		exa='exa -aFb --group-directories-first --icons'
		fd='fd -uL'
		ffmpeg='ffmpeg -hide_banner'
		ffprobe='ffprobe -hide_banner'
		grep='grep --color=auto'
		kudl="ydl -o '%(playlist)s/%(chapter_number)02d-%(chapter)s/%(playlist_index)02d-%(title)s.%(ext)s'"
		ls=exa
		mv='mv -iv'
		open=termux-open
		rm='rm -Iv'
		rsync='rsync -hP'
		cget=termux-clipboard-get
		cset=termux-clipboard-set
		vi=nvim
		ydl=yt-dlp
		ydla='ydl -x -f ba/b'
	)
	# Set aliases
	alias $commands
}
# Set global aliases
alias -g -- --help='--help 2>&1 | col -bx | bat -pl help --theme=Monokai\ Extended'

# Configure functions
# Update python packages
pup () {
	pip install --user -U $(pip list --user -o | awk 'NR>2 {print $1}')
}
# eval MANPAGER
man() {
	command man "$@" | eval $MANPAGER
}
