{ pkgs, ... }:

{
  imports = [ ./apps/common ];

  home.username = "timmy";
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
