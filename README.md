# Starter template for lazyvim

Current repository: https://github.com/kwmiebach/lazyvim

## Ubuntu 24.04

### Get rid of previous installations and config

Remove previous isntallations

```
sudo apt remove --purge vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox neovim nvim
sudo snap remove vim nvim neovim 2>/dev/null && echo "Removed snap packages" || echo "No vim/neovim snap packages found"
sudo apt autoremove
which -a vim vi nvim neovim 2>/dev/null && echo "Found vim/neovim in PATH" || echo "No vim/neovim found in current PATH"
find /usr /opt /snap -name "*vim*" -o -name "*neovim*" 2>/dev/null && echo "Found vim/neovim files in system" || echo "No vim/neovim files found in /usr /opt /snap"
```

Remove previous configurations

```
rm -rf ~/.vim ~/.vimrc ~/.gvimrc

```

# Original README.md

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
