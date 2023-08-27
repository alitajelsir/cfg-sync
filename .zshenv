typeset -U path
path=($HOME/.local/bin $path)
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
ZDOTDIR=$XDG_CONFIG_HOME/zsh
export EDITOR=nvim
export LESS="--tab=2 $LESS"
export MANPATH=$XDG_DATA_HOME/man:$MANPATH
export FFMPEG_DATADIR=$XDG_CONFIG_HOME/ffmpeg
