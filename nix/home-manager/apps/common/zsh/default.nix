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
      lt3 = "exa -lT -L 3 --icons --group-directories-first";

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
    initContent = ''
      setopt CORRECT

      # fzf-tab preview settings
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color=always $realpath'
      zstyle ':fzf-tab:complete:kill:argument' fzf-preview 'ps --pid $word -o cmd --no-headers -w -w'
      zstyle ':fzf-tab:complete:kill:description' fzf-preview 'ps --pid $word -o cmd --no-headers -w -w'
      # Preview directories with tree/ls, text files with bat, others with ls
      zstyle ':fzf-tab:complete:*:*' fzf-preview '
        if [ -e "$realpath" ]; then
          if [ -d "$realpath" ]; then
            command -v tree >/dev/null && tree -C "$realpath" || ls -p --color=always "$realpath"
          else
            mimetype=$(file -b --mime-type "$realpath")
            if [[ "$mimetype" == text/* ]]; then
              command -v bat >/dev/null && bat --style=numbers --color=always "$realpath" || ls -p --color=always "$realpath"
            else
              ls -p --color=always "$realpath"
            fi
          fi
        fi'
    '';
  };
}
