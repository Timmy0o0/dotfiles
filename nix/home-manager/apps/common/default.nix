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
