# Starter template for lazyvim

Current repository: https://github.com/kwmiebach/lazyvim

## Ubuntu 24.04

**Warning: These are destructive operations. Make sure to have backups for everything.***

### Get rid of previous installations and config

Remove previous isntallations

```
sudo apt remove --purge vim vim-runtime gvim vim-tiny vim-common vim-gui-common vim-nox neovim 2>/dev/null || true
sudo snap remove vim nvim neovim 2>/dev/null && echo "Removed snap packages" || echo "No vim/neovim snap packages found"
#sudo apt autoremove
echo "Checking PATH..."
which -a vim vi nvim neovim 2>/dev/null && echo "Found vim/neovim executables in PATH" || echo "No vim/neovim executables found in PATH"
echo "Checking for executables..."
```

Remove previous configurations

```
rm -rf ~/.vim ~/.vimrc ~/.gvimrc
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

### Donload and install Neovim

```
sudo rm /usr/local/bin/nvim
sudo apt install -y libfuse2t64
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
./nvim-linux-x86_64.appimage --version
```


```
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
sudo rm /usr/local/bin/vim
sudo ln -s /usr/local/bin/nvim /usr/local/bin/vim
nvim --version
vim --version
```

###  Download and install config

```
git clone git@github.com:kwmiebach/lazyvim.git ~/.config/nvim
# First run to install plugins
nvim --headless "+Lazy! sync" +qa
```

If the initial plugin sync is interrupted and you see Mason installation failures or tree-sitter CLI errors, run the sync command again:

```
nvim --headless "+Lazy! sync" +qa
```

The installation may take several minutes. Mason will automatically retry failed package installations.

Then launch Neovim: `nvim`

### Adjust config

```
ln -s ~/.config/nvim/lua/config/options.lua ~/options.lua
```

`vim ~/options.lua`

# Original README.md

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
