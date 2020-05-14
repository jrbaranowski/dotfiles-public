<h1>Dotfiles</h1>
This is a repo of dotfiles I like to have on systems I work. Nothing fancy,
just some zsh/vim/tmux settings.

<h2 id="installation">Installation</h2>
Clone the repository into ${HOME}/.dotfiles, then run ${HOME}/.dotfiles/install.sh.
The script will change the default shell to zsh, so you might need to provide your
password.
On the next start of zsh, all configs provided in this repo will overwrite your
existing ones. Backup is done to ${HOME}/.dotfiles/backup.

<h2 id="acknowledgements">Acknowledgements</h2>
* dircolors.256dark taken outright from dircolors.256dark
