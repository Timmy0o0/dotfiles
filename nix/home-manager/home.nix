{ pkgs, ... }:

{
  imports = [
    # Common application configurations
    ./apps/common/git.nix
    ./apps/common/fastfetch.nix
    ./apps/common/zsh
    ./apps/common/yazi
  ];

  home.username = "timmy";
  home.stateVersion = "24.11";

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

  programs.home-manager.enable = true;
}
