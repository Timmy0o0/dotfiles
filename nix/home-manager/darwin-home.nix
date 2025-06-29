{ pkgs, ... }:

{
  imports = [ ./apps/common ./apps/darwin ];

  home.username = "timmy";
  home.stateVersion = "25.05";
  home.homeDirectory = "/Users/timmy";
  programs.home-manager.enable = true;
}
