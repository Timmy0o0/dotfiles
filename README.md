# How to install

## Common Steps

```bash
cd dotfiles
chmod +x stow.sh
./stow.sh
```

## Install Nix

## For Arch Linux

```bash
nix run nixpkgs#home-manager -- switch --flake "nix/#timmy@linux"
home-manager switch --flake "nix/#timmy@linux"
```

change to zsh

```bash
sudo sh -c "echo '/home/timmy/.nix-profile/bin/zsh' >> /etc/shells"
chsh -s $(which zsh)
```

## For macOS

```bash
nix run nixpkgs#home-manager -- switch --flake "nix/#timmy@darwin"
home-manager switch --flake "nix/#timmy@darwin"
```
