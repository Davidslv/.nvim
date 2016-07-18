### Linux (Debian)

```
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update && sudo apt-get install -y neovim
pip3 install --user neovim
pip3 install --user jedi
pip3 install --user yapf
```

### OS X

```
brew update
brew install neovim/neovim/neovim
```

## Create directory

```
mkdir -p ~/.config/nvim/
touch ~/.config/nvim/init.vim

cd ~/.config/nvim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh .
```

Copy [init.vim](init.vim) into `~/.config/nvim/init.vim`

Done!
