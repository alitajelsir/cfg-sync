# Configure	locale
export LC_COLLATE=C
export LC_CTYPE=en_US.UTF-8

# Append PATH
export PATH=$PATH:$HOME/.local/bin

# Set XDG user directories
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# Set zsh configuration directory
ZDOTDIR=$HOME/.config/zsh

# Fix ownership
if [[ $UID != 0 ]]; then
	\fd . -u --owner=root $HOME $PREFIIX -X \
		sudo chown $USERNAME:$USERNAME
fi

# Set apt configuration file
export APT_CONFIG=$XDG_CONFIG_HOME/apt/apt.conf
