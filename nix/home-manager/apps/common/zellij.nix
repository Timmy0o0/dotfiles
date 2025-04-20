{ config, lib, pkgs, ... }:

{
  programs.zellij = { enable = true; };

  home.file.".config/zellij".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/config/zellij";
}
