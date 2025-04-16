{ config, pkgs, ... }:

let nvimPath = "${config.home.homeDirectory}/dotfiles/config/nvim";
in {
  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink nvimPath;

  home.packages = with pkgs; [ neovim ];
}
