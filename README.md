# Installation

## macOS zsh quick start

Install [Homebrew](https://brew.sh) first (including its Command Line Tools
prerequisite), and follow its instructions to add `brew` to your PATH. macOS's
built-in `/bin/zsh` is sufficient; a Homebrew zsh installation is not required.

These packages support shell startup and the standard `ls` and `diff` aliases:

```sh
brew install pyenv pyenv-virtualenv zoxide eza colordiff
```

Clone Prezto **with its submodules**, which include Powerlevel10k:

```sh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
```

If Prezto is already installed, initialize any missing submodules instead:

```sh
git -C "${ZDOTDIR:-$HOME}/.zprezto" submodule update --init --recursive
```

Skip the step in Prezto's instructions that links its default startup files:
this repository supplies those files and selects the Powerlevel10k theme.

Clone this repository into any permanent location, then run the installer:

```sh
git clone https://github.com/gknoy/dotfiles.git "$HOME/git/personal/dotfiles"
zsh -f "$HOME/git/personal/dotfiles/zsh/install.zsh"
```

The installer works from any working directory. It links `.zshenv`, `.zprofile`,
`.zshrc`, `.zpreztorc`, `.zlogin`, and `.p10k.zsh` into `${ZDOTDIR:-$HOME}`.
Existing files, directories, and conflicting symlinks are moved into a unique
`.dotfiles-backup.*` directory there; its location is printed. Correct links are
left alone, so running the installer again is safe. It does not install packages
or change your default shell. Keep the checkout in place: the links point to it.
To undo installation, remove only those six installed symlinks and move any
backed-up originals back into their previous locations.

Use the same `ZDOTDIR` for Prezto and the installer. If you use a custom
`ZDOTDIR`, it must also be set before future shells read their startup files
(for example, in your terminal's environment).

If zsh is not already your default shell, run `chsh -s /bin/zsh`. Open a new
terminal window to load the configuration. Startup supports both Apple Silicon
and Intel Homebrew installations and discovers the checkout through `.zshenv`;
you can explicitly override its location with `GK_DOTFILES`.

For prompt icons, install [Powerlevel10k's recommended MesloLGS NF font](https://github.com/romkatv/powerlevel10k#fonts)
and select it in your terminal settings. The included `.p10k.zsh` supplies the
prompt configuration. `p10k configure` is optional and can rewrite the linked
file in this checkout.

## Optional tools and personal settings

These are not required just to start the shell. Paste this to install all of
the optional Homebrew tools, or remove packages you don't use:

```sh
# the_silver_searcher: ag, used by pww, bb, and other helpers
# mpv: mph and the SUCCESS sound
# xz: database dump compression
# coreutils: md5sum for iTerm2 directory-based tab colors
# mg: EDITOR/VISUAL defaults (or set your preferred editor beforehand)
# emacs: emacsclient for ec / ew
brew install the_silver_searcher mpv xz coreutils mg emacs
```

The remaining optional dependencies belong in project environments or need
additional setup:

| Feature | Additional dependency |
| --- | --- |
| `vnode VERSION` | Install `nodeenv` in a Python environment (e.g. `python -m pip install nodeenv`) |
| Python formatting/testing helpers | Black, pytest, and IPython in your project's Python environment |
| JavaScript formatting/testing helpers | Prettier and Jest in your project's Node environment |
| Container and database helpers | Docker with the relevant project containers running |

The legacy Node 12.16.1 environment at `~/.node-envs/12.16.1` is activated only
if it already exists; it is not an installation prerequisite. Use `vnode VERSION`
to create or activate another version.

`~/.secrets` is optional and is sourced if present. Keep credentials and
work-specific functions there, outside this repository. Some helpers remain
personal/work-specific: `SUCCESS` expects iTerm2's `imgcat` and images in
`~/Pictures`; others use the `pyp` command, custom Git aliases, notes directories,
or functions defined in your secrets file. Review these before using them.
The installer does not configure editors, Git, or Vim.

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