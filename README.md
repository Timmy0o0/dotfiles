# How to install

## Common Steps

```bash
cd dotfiles
chmod +x stow.sh
./stow.sh
```

## Install Nix

## For Arch

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

## For Mac

```bash
scutil --get LocalHostName
# To use Nixpkgs unstable:
nix run nix-darwin/master#darwin-rebuild -- switch
# To use Nixpkgs 24.11:
nix run nix-darwin/nix-darwin-24.11#darwin-rebuild -- switch
darwin-rebuild switch
```
