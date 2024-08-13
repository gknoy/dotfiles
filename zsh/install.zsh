#! /bin/zsh
# Symlink all of our .z* files to home directory
#
# From Prezto readme, files are loaded in this order:
#   ~/.zshenv
#   ~/.zprofile
#   ~/.zshrc
#   ~/.zpreztorc
#   ~/.zlogin

for rcfile in ./z*; do
  ln -s "$(pwd)/$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s "$(pwd)/.p10k.zsh" "${ZDOTDIR:-$HOME}/.p10k.zsh"