# installation steps

### Check out the repo initially
Clone this repo into e.g. `~/git/personal/dotfiles`.  Copy or symlink as desired.

### zsh options
These are mostly copies of the default zprezto configs, with aliases that I use.
```sh
# symlink zsh scripts
pushd zsh
./install.sh
popd
```

### git settings
These are geared for a work laptop, with a different commit author for personal stuff:
```sh
ln -s $(pwd)/git/.gitignore $HOME/.gitignore
ln -s $(pwd)/git/.gitconfig $HOME/.gitconfig
ln -s $(pwd)/git/.gitconfig-personal $HOME/git/personal/.gitconfig
```

### vim
I don't use vim a lot, but I do want nice colors:
```sh
ln -s $(pwd)/vim/.vim $HOME/.vim
ln -s $(pwd)/vim/.vimrc $HOME/.vimrc
```

### Editors
Intellij, VSCode both have config files stored, but they're still a pain to set up.
I haven't yet automated anything useful for these (e.g. plugins), but have exported a theme

- Intellij: use `Twilight_GK.icls` (preferred comment colors)
- VS Code: use `Twilight Pro` theme from the theme store
- Use Jetbrains Mono font + ligatures
- Emacs: Goddess help me.