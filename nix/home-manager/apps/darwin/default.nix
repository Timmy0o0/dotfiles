{ pkgs, ... }:

{
  imports = [
    # macos-specific applications
  ];

  # macos-specific packages
  home.packages = with pkgs;
    [
      # packages only used on macos
      nerd-fonts.jetbrains-mono
    ];

  fonts.fontconfig.enable = true;
}
