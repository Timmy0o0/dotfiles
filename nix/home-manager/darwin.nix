{ pkgs, ... }: {
  imports = [
    # macOS-specific applications
  ];

  # macOS-specific home configuration
  home.homeDirectory = "/Users/timmy";

  # macOS-specific packages
  home.packages = with pkgs;
    [
      # Packages only used on macOS
    ];
}
