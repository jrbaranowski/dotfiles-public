#!/bin/bash

backup_dir=${HOME}/.dotfiles/backup
if [[ -f "${HOME}/.zshrc" ]]; then
    mkdir -p "${backup_dir}"
    cp "${HOME}/.zshrc" "${backup_dir}"
fi

ln -sfn "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"
chsh -s /bin/zsh
