{ pkgs, ... }:

let
  plugins = import ./plugins.nix { inherit pkgs; };
  themes = import ./themes.nix { inherit pkgs; };
  initLua = import ./init.nix { inherit (pkgs) lib; };
  settings = import ./settings.nix;
  keymap = import ./keymap.nix;
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    theme = themes.theme;
    flavors = themes.flavors;
    settings = settings;
    keymap = keymap;
    plugins = plugins;
    initLua = initLua;
  };
}
