{ pkgs, ... }:

{
  imports = [
    # macos-specific applications
    ./kitty.nix # gui apps install in configuration.nix
    ./cursor.nix
  ];

  # macos-specific packages
  home.packages = with pkgs;
    [
      # packages only used on macos
    ];
}
