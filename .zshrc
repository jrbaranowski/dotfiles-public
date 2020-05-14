# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yaar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

function use_mine
{
    my_dir="${HOME}/.dotfiles"

    dotfile="${1}"
    dotfile_fn="$(basename ${dotfile})"
    dotfile_actual=$(readlink "${dotfile}")
    my_file="${my_dir}/${dotfile_fn}"
    if [[ -f ${my_file} ]]; then
        if [[ ${dotfile_actual} != ${my_file} ]]; then
            echo "Using ${dotfile_fn} from ${my_dir}"
            mkdir -p "${my_dir}/backup"
            cp "${dotfile}" "${my_dir}/backup"
            ln -sfn "${my_file}" "${dotfile}"
        fi
    fi
}

# bootstrap prezto if requried
prezto_dir="${ZDOTDIR:-$HOME}/.zprezto"
if [[ ! -d "${prezto_dir}" ]]; then
    echo "Bootstrapping Prezto..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${prezto_dir}"

    setopt EXTENDED_GLOB
    for rcfile in "${prezto_dir}"/runcoms/^README.md(.N); do
        ln -s "${rcfile}" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
fi

# I'm not allowing prezto to override my zshrc, so I need to load it manually
# I also want to always pull zpreztorc from my dir
source "${prezto_dir}"/init.zsh

# pull all the config files I want
use_mine "${HOME}/.zpreztorc"
use_mine "${HOME}/.gitconfig"
use_mine "${HOME}/.gitignore"
use_mine "${HOME}/.vimrc"
use_mine "${HOME}/.tmux.conf"

# use fancy Solarized Dark dircolors
eval $(dircolors ${HOME}/.dotfiles/.dircolors.256dark)

# vim: ts=4 sw=4 et
