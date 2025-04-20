{ pkgs, ... }:

{
  home.packages = [ pkgs.tmuxifier ];

  programs.tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [ vim-tmux-navigator catppuccin yank ];
    extraConfig = ''
      # Add keybinding to reload tmux configuration
      bind r source-file ~/.config/tmux/tmux.conf \; display "Config reloaded!"

      # Set the base index for windows and panes to 1 instead of 0
      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on
      set -g mouse on

      # keybindings
      unbind C-b
      set -g prefix C-a

      # visual mode
      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
  };
}
