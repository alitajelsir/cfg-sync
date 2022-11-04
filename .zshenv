typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export FFMPEG_DATADIR=$XDG_CONFIG_HOME/ffmpeg
export EDITOR=nvim
export LESS="--tab=2 $LESS"
export MANPATH=$HOME/.local/share/man:$MANPATH
