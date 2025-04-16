# System selection (auto-detected)
system := if `uname -s` =~ "Darwin" { "darwin" } else { "linux" }

# Run stow.sh script to create symbolic links
stow:
    chmod +x stow.sh
    ./stow.sh

# Switch home-manager configuration for linux
hm-linux:
    home-manager switch --flake "nix/#timmy@linux"

# Switch home-manager configuration for macOS
hm-darwin:
    home-manager switch --flake "nix/#timmy@darwin"

# Use nix run command (for initial installation)
hm-init:
    nix run nixpkgs#home-manager -- switch --flake "nix/#timmy@{{system}}"

# Automatically select configuration based on current system
hm:
    home-manager switch --flake "nix/#timmy@{{system}}"

# Update all flake inputs
update:
    cd nix && nix flake update

# Clean nix store
gc:
    nix-collect-garbage -d
