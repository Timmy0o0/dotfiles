{ pkgs, lib, config, inputs, ... }:

{
  # add user
  users.users.timmy = {
    name = "timmy";
    home = "/Users/timmy";
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages =
    [ pkgs.mkalias pkgs.kitty pkgs.obsidian pkgs.google-chrome ];

  # add font
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];

  # GUI apps
  homebrew = {
    enable = true;
    brews = [
      # search tool
      # "mas"
      "macism"
    ];
    casks = [ "cursor" ];
    taps = [ "laishulu/homebrew" ];
    #   masApps = {
    #     Yoink = 457622435;
    #   };
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in pkgs.lib.mkForce ''
    # Set up applications.
    echo "setting up /Applications..." >&2
    rm -rf /Applications/Nix\ Apps
    mkdir -p /Applications/Nix\ Apps
    find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
    while read -r src; do
      app_name=$(basename "$src")
      echo "copying $src" >&2
      ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
    done
  '';

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Create /etc/zshrc that loads the nix-darwin environment.
  # programs.zsh.enable = true; # default shell on catalina

  # Set Git commit hash for darwin-version.
  system.configurationRevision =
    inputs.self.rev or inputs.self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  system.defaults = {
    NSGlobalDomain.ApplePressAndHoldEnabled = false;
    NSGlobalDomain.AppleICUForce24HourTime = true;
    NSGlobalDomain.AppleShowAllExtensions = true;
  };

  # The platform the configuration will be used on.
  # darwinSystem = "aarch64-darwin";
  nixpkgs.hostPlatform = "x86_64-darwin";
}
