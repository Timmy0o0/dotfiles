{
  description = "My Nix Configuration for Linux and Darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, nix-darwin, home-manager, ... }@inputs:
    let
      linuxSystem = "x86_64-linux";
      linuxPkgs = nixpkgs.legacyPackages.${linuxSystem};
    in {
      # Darwin configuration
      # scutil --get LocalHostName
      darwinConfigurations."Tianmings-MacBook-Pro" =
        nix-darwin.lib.darwinSystem {
          modules = [
            ./hosts/darwin/configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.timmy = import ./home-manager/darwin-home.nix;
                specialArgs = { inherit inputs; };
              };
            }
          ];
        };

      homeConfigurations = {
        # Linux configuration
        "timmy@linux" = home-manager.lib.homeManagerConfiguration {
          pkgs = linuxPkgs;
          modules = [ ./home-manager/linux-home.nix ];
          extraSpecialArgs = { inherit inputs; };
        };
      };
    };
}
