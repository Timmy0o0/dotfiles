{ pkgs, ... }:

{
  imports = [
    # Common application configurations
    ./git.nix
    ./fastfetch.nix
    ./nvim.nix
    ./zsh
    ./yazi
  ];

  # Install Rust toolchain
  home.activation = {
    installRustToolchain = ''
      echo "==========================================="
      echo "Running installRustToolchain activation script..."

      # Print diagnostic information
      echo "Checking for rustup installation:"
      # echo "PATH = $PATH"

      # Use the full path of rustup
      RUSTUP_PATH="$HOME/.nix-profile/bin/rustup"

      if [ -x "$RUSTUP_PATH" ]; then
        echo "Rustup found at $RUSTUP_PATH, setting default toolchain to stable..."
        $DRY_RUN_CMD "$RUSTUP_PATH" default stable
        echo "Rustup toolchain set successfully."
      else
        echo "Rustup executable not found at $RUSTUP_PATH. Please install rustup first."
      fi
      echo "installRustToolchain activation script completed."
      echo "==========================================="
    '';
  };

  # Packages common to both platforms
  home.packages = with pkgs; [
    # Base Development Environment
    gcc
    nodejs
    rustup
    luarocks
    nixfmt-classic
    bat
    just
    tree
    # General utilities
    neovim
    lazygit
    # Yazi dependencies
    mediainfo
    trash-cli
    nushell
    ouch
    ffmpeg
    jq
    p7zip
    unzip
    poppler
    fd
    ripgrep
    fzf
    imagemagick
    # Zsh utilities
    starship
    zoxide
    eza
  ];
}
