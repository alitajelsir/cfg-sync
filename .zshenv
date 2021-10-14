typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
export PATH
XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share
ZDOTDIR=$XDG_CONFIG_HOME/zsh
export FFMPEG_DATADIR=$XDG_CONFIG_HOME/ffmpeg
EDITOR=nvim
export LESS="--tab=2 $LESS"
