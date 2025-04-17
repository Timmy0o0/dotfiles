{ pkgs, ... }:

{
  imports = [ ./apps/common ./apps/linux ];

  home.username = "timmy";
  home.stateVersion = "24.11";
  home.homeDirectory = "/home/timmy";
  programs.home-manager.enable = true;
}
