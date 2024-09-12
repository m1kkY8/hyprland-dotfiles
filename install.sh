#!/usr/bin/env bash

if [[ -f packages ]]; then
  yay -S --noconfirm - <packages
fi
