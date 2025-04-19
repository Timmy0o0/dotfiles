{
  description = "Nix Configuration for Linux";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      linuxSystem = "x86_64-linux";
      linuxPkgs = nixpkgs.legacyPackages.${linuxSystem};
    in {
      homeConfigurations = {
        # Linux configuration
        "timmy@linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = linuxPkgs;
          modules = [ ../../home-manager/linux-home.nix ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
