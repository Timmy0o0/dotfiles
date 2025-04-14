{ pkgs, ... }:

{
  imports = [ ./apps/fastfetch.nix ./apps/zsh.nix ./apps/yazi ./apps/git.nix ];
  home.username = "timmy";
  home.homeDirectory = "/home/timmy";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    # general
    neovim
    lazygit
    nixfmt-classic
    # yazi
    mediainfo
    ffmpeg
    jq
    p7zip
    ouch
    poppler
    fd
    ripgrep
    fzf
    imagemagick
    trash-cli
    nushell
    # zsh
    starship
    zoxide
    eza
  ];
  programs.home-manager.enable = true;
}
