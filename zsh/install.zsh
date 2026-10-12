#!/bin/zsh -f
set -eu

script_dir=${0:A:h}
target_dir=${ZDOTDIR:-$HOME}
backup_dir=''
rcfiles=(zshenv zprofile zshrc zpreztorc zlogin .p10k.zsh)

mkdir -p "$target_dir"

for rcfile in "${rcfiles[@]}"; do
  source_file="$script_dir/$rcfile"
  target_file="$target_dir/.${rcfile#.}"

  if [[ ! -f "$source_file" ]]; then
    print -u2 -- "Missing configuration file: $source_file"
    exit 1
  fi

  if [[ -L "$target_file" && "${target_file:A}" == "$source_file" ]]; then
    print -- "Already linked: $target_file"
    continue
  fi

  if [[ -e "$target_file" || -L "$target_file" ]]; then
    if [[ -z "$backup_dir" ]]; then
      backup_dir=$(mktemp -d "$target_dir/.dotfiles-backup.XXXXXXXX")
      print -- "Backing up existing configuration to: $backup_dir"
    fi
    mv "$target_file" "$backup_dir/${target_file:t}"
  fi

  ln -s "$source_file" "$target_file"
  print -- "Linked: $target_file -> $source_file"
done