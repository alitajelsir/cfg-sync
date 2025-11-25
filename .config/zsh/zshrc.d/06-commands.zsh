# Configure aliases
() {

	# List aliases
	local -a _commands=(
		%= \$= ❯=
		-='cd -'
		bh='col -bx | bat -pl help --theme=Monokai\ Extended'
		cget=termux-clipboard-get
		cpi='cp -iv'
		cset=termux-clipboard-set
		lsa='eza -abF --group-directories-first --icons=auto'
		fh='fd -uL --exclude=.suroot'
		ffm='ffmpeg -hide_banner'
		ffp='ffprobe -hide_banner'
		mvi='mv -iv'
		open=termux-open
		plg="cd $(mktemp -d)"
		rmi='rm -Iv'
		rsp='rsync -P'
		mdl=yt-dlp
		mdla='yt-dlp -x -f ba/b'
	)

	# Set aliases
	alias -- $_commands
}

[[ $UID == 0 ]] ||
	alias cfg="git --git-dir $GITDIR/cfg-sync/ --work-tree $HOME"


# Configure functions
# Colorize manpages
man() {
	command man "$@" | col --no-backspaces --spaces |
	bat --plain --language=man --theme=Monokai\ Extended
}

# Upgrade all pip installed packages
pup() {
	local -a _outdated=($(pip list --user --outdated | awk 'NR>2 {print $1}'))
	[[ -z $_outdated ]] ||
		pip install --user --upgrade $_outdated
}
