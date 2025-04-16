{ pkgs, ... }: {
  imports = [
    # Linux-specific applications
  ];

  # Linux-specific home configuration
  home.homeDirectory = "/home/timmy";

  # Linux-specific packages
  home.packages = with pkgs;
    [
      # Packages only used on Linux
    ];
}

