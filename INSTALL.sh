#!/usr/bin/env bash
#
# bootstrap installs things.

info () {
    printf " [ \033[00;34m..\033[0m ] $1"
}

user () {
    printf "\r [ \033[0;33m?\033[0m ] $1 "
}

success () {
    printf "\r\033[2K [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}

if [ -f config/config.sh ]; then
    source config/config.sh
else
    fail "No such file or direcotry: config/config.sh"
fi

DOTFILES_ROOT=$(pwd)

set -e

echo ''

link_file () {
    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

    # If is a file or a directory or a link
    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
    then

        if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
        then

            local currentSrc="$(readlink $dst)"

            # If dst is already a link
            if [ "$currentSrc" == "$src" ]
            then
                skip=true;
            else

                user "File already exists: $(basename "$src"), what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
                read -n 1 action

                case "$action" in
                    o )
                        overwrite=true;;
                    O )
                        overwrite_all=true;;
                    b )
                        backup=true;;
                    B )
                        backup_all=true;;
                    s )
                        skip=true;;
                    S )
                        skip_all=true;;
                    * )
                        ;;
                esac

            fi

        fi

        overwrite=${overwrite:-$overwrite_all}
        backup=${backup:-$backup_all}
        skip=${skip:-$skip_all}

        if [ "$overwrite" == "true" ]
        then
            rm -rf "$dst"
            success "removed $dst"
        fi

        if [ "$backup" == "true" ]
        then
            mv "$dst" "${dst}.backup"
            success "moved $dst to ${dst}.backup"
        fi

        if [ "$skip" == "true" ]
        then
            success "skipped $src"
        fi
    fi

    if [ "$skip" != "true" ] # "false" or empty
    then
        ln -s "$1" "$2"
        success "linked $1 to $2"
    fi
}

install_dotfiles () {
    info 'installing dotfiles'

    [ -f .installed.list ] && rm -f .installed.list

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find "$DOTFILES_ROOT" -maxdepth 5 -name '*.symlink')
    do

        begin=${src#`pwd`/*}

        if ! dotfiles_excluded_module ${begin%%/*}
        then
            item=${src#`pwd`/*/}
            if [[ `dirname $item` == '.' ]]; then
                dst="$HOME/.$(basename "${item%.*}")"
            else
                directory="$HOME/.$(dirname $item)"
                [ -d $directory ] || mkdir -pv $directory
                dst="$directory/`basename "${item%.*}"`"
            fi

            echo $dst >> .installed.list
            link_file "$src" "$dst"
        fi

    done
}

install_dotfiles

echo ''
echo ' All installed!'