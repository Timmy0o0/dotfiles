# System selection (auto-detected)
system := if `uname -s` =~ "Darwin" { "darwin" } else { "linux" }

# Use nix run command (for initial installation)
hm-linux-init:
    nix run nixpkgs#home-manager --extra-experimental-features "nix-command flakes" -- switch --flake "./nix/hosts/linux#timmy"

hm-linux:
    home-manager switch --flake "./nix/hosts/linux#timmy"

hm-linux-update:
    nix flake update --flake "./nix/hosts/linux"

# darwin
darwin-init:
    nix run nix-darwin/master#darwin-rebuild --extra-experimental-features "nix-command flakes" -- switch --flake "./nix/hosts/darwin#mini"

darwin:
    darwin-rebuild switch --flake "./nix/hosts/darwin#mini"

darwin-update:
    nix flake update --flake "./nix/hosts/darwin"

# Clean nix store
gc:
    nix-collect-garbage -d
