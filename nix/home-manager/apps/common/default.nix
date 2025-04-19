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

      # Check both possible paths for rustup (single-user and multi-user installations)
      RUSTUP_PATH_SINGLE="$HOME/.nix-profile/bin/rustup"
      RUSTUP_PATH_MULTI="/etc/profiles/per-user/$USER/bin/rustup"

      if [ -x "$RUSTUP_PATH_SINGLE" ]; then
        RUSTUP_PATH="$RUSTUP_PATH_SINGLE"
      elif [ -x "$RUSTUP_PATH_MULTI" ]; then
        RUSTUP_PATH="$RUSTUP_PATH_MULTI"
      else
        RUSTUP_PATH=""
      fi

      if [ -n "$RUSTUP_PATH" ]; then
        echo "Rustup found at $RUSTUP_PATH, setting default toolchain to stable..."
        $DRY_RUN_CMD "$RUSTUP_PATH" default stable
        echo "Rustup toolchain set successfully."
      else
        echo "Rustup executable not found. Please install rustup first."
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
