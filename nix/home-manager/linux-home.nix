{ pkgs, ... }:

{
  imports = [ ./apps/common ./apps/linux ];

  home.username = "timmy";
  home.stateVersion = "25.05";
  home.homeDirectory = "/home/timmy";
  programs.home-manager.enable = true;
}
