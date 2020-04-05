#!/usr/bin/env bash

#######################################################################
# Functions

dotfiles_excluded_module () {
    local seeking=$1
    local in=1
    for element in "${DOTFILES_EXCLUDE[@]}"; do
        if [[ $element == $seeking ]]; then
            in=0
            break
        fi
    done
    return $in
}

activated_module() {
    if ! dotfiles_excluded_module $1
    then
        return 0
    else
        return 1
    fi
}

isParameter () {
    if [[ $1 == $2 ]]
    then
        return 0
    else
        return 1
    fi
}

#----------------------------------------------------------------------
# OS

isArchLinux () {
    isParameter $DOTFILES_OS $DOTFILES_VAR_ARCH
}

isDebian () {
    isParameter $DOTFILES_OS $DOTFILES_VAR_DEBIAN
}

#----------------------------------------------------------------------
# ENV

isDesktop () {
    isParameter $DOTFILES_ENV $DOTFILES_VAR_DESKTOP
}

isServer () {
    isParameter $DOTFILES_ENV $DOTFILES_VAR_SERVER
}

#----------------------------------------------------------------------
# USER

isRoot () {
    isParameter $DOTFILES_USER $DOTFILES_VAR_ROOT
}

isAdmin () {
    isParameter $DOTFILES_USER $DOTFILES_VAR_ADMIN
}

isUser () {
    isParameter $DOTFILES_USER $DOTFILES_VAR_USER
}

#######################################################################
# Example

# ------
# Module
# ------

# if activated_module $DOTFILES_ZSH
# then
#     echo yes
# else
#     echo no
# fi

# ---------
# Parameter
# ---------

# if isArchLinux
# then
#     echo yes
# else
#     echo no
# fi
