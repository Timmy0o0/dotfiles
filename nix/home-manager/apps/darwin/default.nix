{ pkgs, ... }:

{
  imports = [
    # macos-specific applications
  ];

  # macos-specific home configuration
  home.homedirectory = "/Users/timmy";

  # macos-specific packages
  home.packages = with pkgs;
    [
      # packages only used on macos
    ];
}
