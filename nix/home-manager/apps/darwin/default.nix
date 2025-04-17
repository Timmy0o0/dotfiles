{ pkgs, ... }:

{
  imports = [
    # macos-specific applications
    ./kitty.nix
  ];

  # macos-specific packages
  home.packages = with pkgs; [
    # packages only used on macos
    nerd-fonts.jetbrains-mono
    iterm2
  ];

  fonts.fontconfig.enable = true;
}
