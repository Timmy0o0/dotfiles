{ pkgs, ... }:

{
  imports = [
    # Common application configurations
    ./git.nix
    ./fastfetch.nix
    ./zsh
    ./yazi
  ];

  # Packages common to both platforms
  home.packages = with pkgs; [
    # Development tools
    gcc
    nodejs
    # General utilities
    neovim
    lazygit
    nixfmt-classic
    # Yazi dependencies
    mediainfo
    trash-cli
    nushell
    ouch
    ffmpeg
    jq
    p7zip
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
