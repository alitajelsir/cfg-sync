() {
	local -a zsh_aliases=(
		bh='col -bx | bat -pl help --theme=Monokai\ Extended'
		bm='col -bx | bat -pl man --theme=Monokai\ Extended'
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
	alias $zsh_aliases
}

pup () {
	pip install --user -U $(pip list --user -o | awk 'NR>2 {print $1}')
}
