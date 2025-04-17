{ pkgs, ... }:

{
  imports = [ ./apps/common ./apps/darwin ];

  home.username = "timmy";
  home.stateVersion = "24.11";
  home.homeDirectory = "/Users/timmy";
  programs.home-manager.enable = true;
}
