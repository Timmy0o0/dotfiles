# How to install

## Common Steps

```bash
cd dotfiles
chmod +x stow.sh
./stow.sh
```

## For Arch Linux

```bash
nix run nixpkgs#home-manager -- switch --flake "nix/#timmy@linux"
```

## For macOS

```bash
nix run nixpkgs#home-manager -- switch --flake "nix/#timmy@darwin"
```
