# Dotfiles

## Create link

```bash
# instal dependency package
sudo pacman -S neovim ranger lazygit git openssh fzf ripgrep cmake make gcc npm xclip

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
