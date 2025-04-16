{
  description = "My Nix Configuration for Linux and Darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, darwin, home-manager, ... }:
    let
      linuxSystem = "x86_64-linux";
      # Assuming Mac is an M-series chip, change to x86_64-darwin if it's an Intel chip
      darwinSystem = "x86_64-darwin";
      # darwinSystem = "aarch64-darwin";
      linuxPkgs = nixpkgs.legacyPackages.${linuxSystem};
      darwinPkgs = nixpkgs.legacyPackages.${darwinSystem};
    in {
      homeConfigurations = {
        # Linux configuration
        "timmy@linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = linuxPkgs;
          modules = [ ./home-manager/home.nix ./home-manager/linux.nix ];
        };

        # Darwin configuration
        "timmy@darwin" = home-manager.lib.homeManagerConfiguration {
          pkgs = darwinPkgs;
          modules = [ ./home-manager/home.nix ./home-manager/darwin.nix ];
        };
      };
    };
}
