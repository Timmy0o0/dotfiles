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
  environment.systemPackages = [ pkgs.mkalias ];

  # add font
  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono maple-mono.NF-CN ];

  # GUI apps
  homebrew = {
    enable = true;
    brews = [
      # search tool
      # "mas"
      "macism"
    ];
    casks = [
      "cursor"
      "zen"
      "arc"
      "kitty"
      "obsidian"
      "google-chrome"
      "logi-options+"
      "steam"
      "notion"
      "wechat"
      "qq"
      "qqmusic"
      "squirrel"
      "wpsoffice"
    ];
    taps = [ "laishulu/homebrew" ];
    masApps = { iShot = 1485844094; };
    onActivation = {
      cleanup = "zap";
      autoUpdate = true;
      upgrade = true;
    };
  };

  # system.activationScripts.applications.text = let
  #   env = pkgs.buildEnv {
  #     name = "system-applications";
  #     paths = config.environment.systemPackages;
  #     pathsToLink = "/Applications";
  #   };
  # in pkgs.lib.mkForce ''
  #   # Set up applications.
  #   echo "setting up /Applications..." >&2
  #   rm -rf /Applications/Nix\ Apps
  #   mkdir -p /Applications/Nix\ Apps
  #   find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
  #   while read -r src; do
  #     app_name=$(basename "$src")
  #     echo "copying $src" >&2
  #     ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
  #   done
  # '';

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
    finder.FXPreferredViewStyle = "clmv";
    finder.ShowPathbar = true;
    finder.ShowStatusBar = true;
    finder.NewWindowTarget = "Home";
    finder.FXDefaultSearchScope = "SCcf";
    # finder.AppleShowAllFiles = false;
    # finder._FXShowPosixPathInTitle = false;
    trackpad.Clicking = true;
    trackpad.TrackpadThreeFingerDrag = true;
    # stage manager
    WindowManager.GloballyEnabled = true;

    # dock = {
    #   show-recents = true;
    #   static-only = true;
    #   autohide = false;
    #   orientation = "bottom";
    #   tilesize = 48;
    # };
  };

  # The platform the configuration will be used on.
  # nixpkgs.hostPlatform = "x86_64-darwin";
  nixpkgs.hostPlatform = "aarch64-darwin";
}
