{ pkgs, ... }: {
  imports = [
    # Linux-specific applications
  ];

  # Linux-specific packages
  home.packages = with pkgs;
    [
      # Packages only used on Linux
    ];
}

