{ pkgs, ... }:

{
  imports = [
    # macos-specific applications
    ./kitty.nix # gui apps install in configuration.nix
    ./cursor.nix
  ];

  # Set environment variables for better compilation support
  # TODO: delete this after nil on mac is fixed
  # for nil on mac temporary solution
  # home.sessionVariables = { LIBRARY_PATH = "${pkgs.libiconv}/lib"; };
  home.packages = with pkgs;
    [
      # packages only used on macos
      libiconv
    ];
}
