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
    # zsh
    starship
    zoxide
    eza
  ];
  programs.home-manager.enable = true;
}
