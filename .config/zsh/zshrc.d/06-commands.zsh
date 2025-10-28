# Configure aliases
() {

	# List aliases
	local -a _commands=(
		%= \$= ❯=
		-='cd -'
		aria2c="aria2c --dir $HOME/Downloads"
		bh='col -bx | bat -pl help --theme=Monokai\ Extended'
		cfg="git --git-dir $XDG_DATA_HOME/git/cfg-sync --work-tree $HOME"
		cp='cp -iv'
		eza='eza -abF --icons --group-directories-first'
		fd='fd -u'
		ffmpeg='ffmpeg -hide_banner'
		ffprobe='ffprobe -hide_banner'
		help=run-help
		ls=eza
		mdl=yt-dlp
		mdla='yt-dlp -x -f ba/b'
		mv='mv -iv'
		plg="cd $(mktemp -d)"
		pvc='protonvpn-cli c -f'
		pvd='protonvpn-cli d'
		pvs='protonvpn-cli s'
		rm='rm -Iv'
		rsync='rsync -P'
		sudo='sudo '
	)

	# Set aliases
	alias -- $_commands
}

# Set global aliases
alias -g '$= '
