{ config, pkgs, ... }:

{
  imports = [ ./apps/fastfetch.nix ./apps/zsh.nix ./apps/yazi/default.nix ];
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
  programs.git = {
    enable = true;
    userName = "timmy";
    userEmail = "yangtmeco@outlook.com";
  };
  programs.home-manager.enable = true;
}
