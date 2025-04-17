{ pkgs, ... }:

{
  imports = [ ./secrets.nix ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    sessionVariables = { EDITOR = "nvim"; };
    shellAliases = {
      # pipline
      ls = "exa --icons --group-directories-first";
      ll = "exa -l --icons --group-directories-first";
      la = "exa -la --icons --group-directories-first";
      lt = "exa -lT --icons --group-directories-first";

      # general
      c = "clear";
      v = "$EDITOR";
      ff = "fastfetch";
      lg = "lazygit";
    };
    plugins = [
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "zsh-vi-mode";
        src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
      }
    ];
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "zoxide" "starship" ];
      theme = "robbyrussell";
    };
    initExtra = ''
      setopt CORRECT
    '';
  };
}
