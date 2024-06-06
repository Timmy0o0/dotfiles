# Dotfiles

## Init Conf

```bash
# instal dependency package
sudo pacman -S neovim ranger lazygit git openssh fzf ripgrep cmake make gcc npm xclip unzip

# instal zsh
sudo pacman -S zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo pacman -S zsh-syntax-highlighting
sudo pacman -S zsh-autosuggestions

# TODO delete original rc

# ln -s /home/user/original /home/user/symlinks/original_link
ln -s ~/dotfiles/.config ~/.config
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zshrc ~/.zshrc

# ranger plugins
git clone https://github.com/cdump/ranger-devicons2 ~/.config/ranger/plugins/devicons2

source .zshrc
```

## Add WSL Clip

```bash
# use latest win32yank
curl -sLo ~/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
sudo unzip ~/win32yank.zip -d /usr/local/bin
sudo chmod +x /usr/local/bin/win32yank.exe
```

## Python env

```base
sudo pacman -S python
sudo pacman -S python-virtualenv
sudo pacman -S python-virtualenvwrapper

mkvirtualenv base
```
