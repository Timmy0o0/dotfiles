{ pkgs, ... }:

{
  imports = [ ];

  programs.kitty = {
    enable = true;
    darwinLaunchOptions = [ "--single-instance" "--directory=~" ];
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 15;
    };
    settings = {
      remember_window_size = "no";
      initial_window_width = 950;
      initial_window_height = 500;
      cursor_blink_interval = "0.5";
      cursor_stop_blinking_after = 1;
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      enable_audio_bell = "yes";
      window_padding_width = 10;
      hide_window_decorations = "no";
      background_opacity = "1.0";
      dynamic_background_opacity = "yes";
      confirm_os_window_close = 0;
      cursor_trail = 3;
    };
    keybindings = { "f11" = "toggle_fullscreen"; };
    themeFile = "everforest_dark_medium";
  };
}
