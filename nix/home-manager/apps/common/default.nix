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
      if command -v rustup &>/dev/null; then
        $DRY_RUN_CMD rustup default stable
      fi
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
