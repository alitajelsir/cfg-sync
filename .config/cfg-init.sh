echo 'Installing needed packages...'

pkg install git rsync zsh -y

echo 'Syncing $HOME configurations...'

git clone --depth 1 --quiet --bare --single-branch --branch termux \
https://github.com/alitajelsir/config-sync.git $HOME/.config/cfg-sync

cfg () {
	/usr/bin/git --git-dir=$HOME/.config/cfg-sync --work-tree=$HOME $@
}
cfg checkout 2>/dev/null

if [ $? = 0 ]; then
	echo 'Syncing completed successfully'
	else
		echo 'Backing up pre-existing files...'

		cfg checkout 2>&1 |
		grep -E "\s+\." | awk {'print $1'} | xargs -I'{}' \
		rsync -ahR --remove-source-files '{}' $HOME/.config/cfg-bak
		cfg checkout

		echo 'Syncing completed successfully'
fi

cfg config --local status.showUntrackedFiles no

ln -sf .config/profile.d/env-vars.sh $PREFIX/etc/profile.d

chsh -s zsh

exit
