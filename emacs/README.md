### Emacs config

Currently using https://emacsforosx.com/

`brew install emacs` is supposed to also work.

### packages to install

Emacs automatically tracks installed packages in the `package-selected-packages` variable (in `~/.emacs`).

Re-install the desires packages:
```
M-x package-refresh-contents
M-x package-install-selected-packages
```
