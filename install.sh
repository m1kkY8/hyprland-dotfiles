#!/usr/bin/env bash

if [[ -f packages ]] ;then
    cat packages
    sudo pacman -S --noconfirm - < packages
fi


