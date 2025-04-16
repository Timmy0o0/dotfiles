# How to install

```bash
cd dotfiles
chmod +x stow.sh
./stow.sh
nix run nixpkgs#home-manager -- switch --flake "nix/#$USER"
home-manager switch --flake "nix/#$USER"
```
