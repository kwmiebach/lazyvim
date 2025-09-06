# Starter template for lazyvim

Current repository: https://github.com/kwmiebach/lazyvim

## Ubuntu 24.04

### Get rid of previous installations and config

Remove previous isntallations

```
sudo apt remove --purge vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox neovim 2>/dev/null || true
sudo snap remove vim nvim neovim 2>/dev/null && echo "Removed snap packages" || echo "No vim/neovim snap packages found"
#sudo apt autoremove
echo "Checking PATH..."
which -a vim vi nvim neovim 2>/dev/null && echo "Found vim/neovim executables in PATH" || echo "No vim/neovim executables found in PATH"
echo "Checking for executables..."
if find /usr/bin /usr/local/bin /opt -name "vim" -o -name "vi" -o -name "nvim" -o -name "neovim" 2>/dev/null | grep -q .; then echo "Found vim/neovim executables in system"; else echo "No vim/neovim executables found in system"; fi
```

Remove previous configurations

```
rm -rf ~/.vim ~/.vimrc ~/.gvimrc

```

# Original README.md

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
