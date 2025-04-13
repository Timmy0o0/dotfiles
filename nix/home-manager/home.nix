{ config, pkgs, ... }:

{
  imports = [
    ./apps/micro.nix
  ];
  home.username = "timmy";
  home.homeDirectory = "/home/timmy";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    # zsh
    zsh
    starship
    zoxide
    lazygit
    eza
    # general
    fastfetch
    neovim
  ];
  programs.git = {
    enable = true;
    userName = "timmy";
    userEmail = "yangtmeco@outlook.com";
  };
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      # pipline
      ls = "exa --icons --group-directories-first";
      ll = "exa -l --icons --group-directories-first";
      la = "exa -la --icons --group-directories-first";
      lt = "exa -lT --icons --group-directories-first";

      # general
      c = "clear";
      ff = "fastfetch";
      lg = "lazygit";
      v = "$EDITOR";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "zoxide" "starship"];
      theme = "robbyrussell";
    };
    initExtra = ''
      setopt CORRECT
      export EDITOR=nvim
    '';
  };
  programs.home-manager.enable = true;
}
