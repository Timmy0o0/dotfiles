{ config, pkgs, ... }:

{
  imports = [
    ./apps/micro.nix
    ./apps/fastfetch.nix
    ./apps/zsh.nix
  ];
  home.username = "timmy";
  home.homeDirectory = "/home/timmy";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    # general
    neovim
  ];
  programs.git = {
    enable = true;
    userName = "timmy";
    userEmail = "yangtmeco@outlook.com";
  };
  programs.home-manager.enable = true;
}
