# Configure aliases
local -a _commands=(
	%= \$= ❯=
	-='cd -'
	bh='col -bx | bat -pl help --theme=Monokai\ Extended'
	cget=termux-clipboard-get
	cp='cp -iv'
	cset=termux-clipboard-set
	eza='eza -abF --group-directories-first --icons=auto'
	fd='fd -uL --exclude=.suroot'
	ffmpeg='ffmpeg -hide_banner'
	ffprobe='ffprobe -hide_banner'
	ls=eza
	mv='mv -iv'
	open=termux-open
	plg="cd $(mktemp -d)"
	rm='rm -Iv'
	rsync='rsync -P'
	vi=nvim
	mdl=yt-dlp
	mdla='yt-dlp -x -f ba/b'
)

# Set aliases
alias -- $_commands


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
	local -a outdated=($(pip list --user --outdated | awk 'NR>2 {print $1}'))
	[[ -z $outdated ]] ||
		pip install --user --upgrade $outdated
}
