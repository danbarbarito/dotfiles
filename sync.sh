#!/usr/bin/env bash

cd ~/.dotfiles
cd emacs.d
git add -A
git commit -m "Bump using sync.sh"
git push
cd ~/.dotfiles
git add -A
git commit -m "Bump using sync.sh"
git push
