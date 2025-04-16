# How to install

## Common Steps

```bash
cd dotfiles
chmod +x stow.sh
./stow.sh
```

## Install Nix

## Build Nix Config

```bash
# install just
just hm-init
just hm
```

change to zsh

```bash
sudo sh -c "echo '/home/timmy/.nix-profile/bin/zsh' >> /etc/shells"
chsh -s $(which zsh)
```
