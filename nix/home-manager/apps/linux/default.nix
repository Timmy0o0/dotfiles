{ pkgs, config, ... }:

{
  imports = [
    # Linux-specific applications
  ];

  # nix config
  home.file = {
    ".config/nix".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/dotfiles/config/nix";
  };

  # Linux-specific packages
  home.packages = with pkgs;
    [
      # Packages only used on Linux
    ];
}

