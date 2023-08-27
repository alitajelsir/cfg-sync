alias bh='col -bx | bat -pl help --theme=Monokai\ Extended'
alias cfg="git --git-dir $HOME/.config/cfg-sync/ --work-tree $HOME"
alias cp='cp -iv'
alias exa='exa -aFb --group-directories-first --icons'
alias fd='fd -uL'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias grep='grep --color=auto'
alias help=run-help
alias kudl="ydl -o '%(playlist)s/%(chapter_number)02d-%(chapter)s/%(playlist_index)02d-%(title)s.%(ext)s'"
alias ls=exa
alias mv='mv -iv'
alias open=termux-open
alias rm='rm -Iv'
alias rsync='rsync -hP'
alias cget=termux-clipboard-get
alias cset=termux-clipboard-set
alias vi=nvim
alias ydl=yt-dlp
alias ydla='ydl -x -f ba/b'

# Use bat to show man-db
bman() {
	man "$@" | col -bx | bat -pl man --theme=Monokai\ Extended
}
alias man=bman

# User session pip packages updater
pup () {
	pip install --user -U $(pip list --user -o | awk 'NR>2 {print $1}')
}
