{ pkgs, ... }:

let
  yazi-plugins = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "b12a9ab085a8c2fe2b921e1547ee667b714185f9";
    hash = "sha256-LWN0riaUazQl3llTNNUMktG+7GLAHaG/IxNj1gFhDRE=";
  };
  # yazi-flavors = pkgs.fetchFromGitHub {
  #   owner = "yazi-rs";
  #   repo = "flavors";
  #   rev = "68326b4ca4b5b66da3d4a4cce3050e5e950aade5";
  #   hash = "sha256-nhIhCMBqr4VSzesplQRF6Ik55b3Ljae0dN+TYbzQb5s=";
  # };
  everforest-medium = pkgs.fetchFromGitHub {
    owner = "Chromium-3-Oxide";
    repo = "everforest-medium.yazi";
    rev = "3d5f8471fa6d5c2130d8a980b4ef48d8c5c8521d";
    hash = "sha256-FXg++wVSGrJZnYodzkS4eVIeQE1xm8o0urnoInqfP5g=";
  };
  flexoki-light = pkgs.fetchFromGitHub {
    owner = "gosxrgxx";
    repo = "flexoki-light.yazi";
    rev = "9d53f85a290155b4750af3739c804dca1e8ad054";
    hash = "sha256-5dlD4CvLwpSA2XJJtm562vAyZfsKWQGdbwkQJuXj5Jk=";
  };
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";
    theme = {
      flavor = {
        dark = "everforest-medium";
        light = "flexoki-light";
      };
    };
    flavors = {
      everforest-medium = "${everforest-medium}";
      flexoki-light = "${flexoki-light}";
      # dracula = "${yazi-flavors}/dracula.yazi";
    };

    # yazi.toml
    settings = {
      manager = { show_hidden = true; };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
      plugin = {
        prepend_fetchers = [
          {
            id = "git";
            name = "*";
            run = "git";
          }
          {
            id = "git";
            name = "*/";
            run = "git";
          }
        ];
        prepend_preloaders = [
          # Replace magick, image, video with mediainfo
          {
            mime = "{audio,video,image}/*";
            run = "mediainfo";
          }
          {
            mime = "application/subrip";
            run = "mediainfo";
          }
        ];
        prepend_previewers = [
          # Replace magick, image, video with mediainfo
          {
            mime = "{audio,video,image}/*";
            run = "mediainfo";
          }
          {
            mime = "application/subrip";
            run = "mediainfo";
          }
          # ouch
          {
            mime = "application/*zip";
            run = "ouch";
          }
          {
            mime = "application/x-tar";
            run = "ouch";
          }
          {
            mime = "application/x-bzip2";
            run = "ouch";
          }
          {
            mime = "application/x-7z-compressed";
            run = "ouch";
          }
          {
            mime = "application/x-rar";
            run = "ouch";
          }
          {
            mime = "application/x-xz";
            run = "ouch";
          }
          {
            mime = "application/xz";
            run = "ouch";
          }
        ];
      };
    };

    plugins = {
      chmod = "${yazi-plugins}/chmod.yazi";
      full-border = "${yazi-plugins}/full-border.yazi";
      git = "${yazi-plugins}/git.yazi";
      jump-to-char = "${yazi-plugins}/jump-to-char.yazi";
      smart-filter = "${yazi-plugins}/smart-filter.yazi";
      smart-enter = "${yazi-plugins}/smart-enter.yazi";
      bypass = pkgs.fetchFromGitHub {
        owner = "Rolv-Apneseth";
        repo = "bypass.yazi";
        rev = "2ab6d84e8165985dd4d63ef0098e3a30feb3a41a";
        hash = "sha256-6LiBUvHmN8q/ao1+QhCg75ypuf1i6MyRQiU16Lb8pEs=";
      };
      mediainfo = pkgs.fetchFromGitHub {
        owner = "boydaihungst";
        repo = "mediainfo.yazi";
        rev = "436cb5f04d6e5e86ddc0386527254d87b7751ec8";
        hash = "sha256-oFp8mJ62FsJX46mKQ7/o6qXPC9qx3+oSfqS0cKUZETI=";
      };
      ouch = pkgs.fetchFromGitHub {
        owner = "ndtoan96";
        repo = "ouch.yazi";
        rev = "2496cd9ac2d1fb52597b22ae84f3af06c826a86d";
        hash = "sha256-OsNfR7rtnq+ceBTiFjbz+NFMSV/6cQ1THxEFzI4oPJk=";
      };
      restore = pkgs.fetchFromGitHub {
        owner = "boydaihungst";
        repo = "restore.yazi";
        rev = "328dd888c1e2b9b0cb5dc806f099e3164e179620";
        hash = "sha256-3Z8P25u9bffdjrPjxLRWUQn6MdBS+vyElUBkgV4EUwY=";
      };
      starship = pkgs.fetchFromGitHub {
        owner = "Rolv-Apneseth";
        repo = "starship.yazi";
        rev = "c0707544f1d526f704dab2da15f379ec90d613c2";
        hash = "sha256-H8j+9jcdcpPFXVO/XQZL3zq1l5f/WiOm4YUxAMduSRs=";
      };
      sudo = pkgs.fetchFromGitHub {
        owner = "TD-Sky";
        repo = "sudo.yazi";
        rev = "af70636fbcf30ef17f77c5ffcfcbf1342c554be1";
        hash = "sha256-IvTBAhZrbrNJ5nsLxr35V0ntQw89yXUdoU9ashbflYY=";
      };
      what-size = pkgs.fetchFromGitHub {
        owner = "pirafrank";
        repo = "what-size.yazi";
        rev = "f1c6b691363e602d0ddbee29384017d08b608f64";
        hash = "sha256-M1phqmo318/VYkLWiqjEWuHlnQ+hfz5H+k8G0zsmclg=";
      };
      copy-file-contents = let
        src = pkgs.fetchFromGitHub {
          owner = "AnirudhG07";
          repo = "plugins-yazi";
          rev = "524c52c7e433834e36a502abd1e31a6a65c8caf0";
          hash = "sha256-GrPqcHYG+qHNi80U+EJJd1JjdAOexiE6sQxsqdeCSMg=";
        };
      in "${src}/copy-file-contents.yazi";
    };

    initLua = ''
      require("full-border"):setup()
      require("git"):setup({})
      require("starship"):setup()
      require("copy-file-contents"):setup({
        clipboard_cmd = "win32yank.exe -i",
        -- clipboard_cmd = "wl-copy",
        append_char = "\n",
        notification = true,
      })
      require("session"):setup({
        sync_yanked = true,
      })
    '';

    keymap = {
      manager.prepend_keymap = [
        # bypass
        # {
        # 	on = "l";
        # 	run = "plugin bypass smart_enter";
        # 	desc = "Open a file, or recursively enter child directory, skipping children with only a single subdirectory";
        # }
        {
          on = "l";
          run = "plugin smart-enter";
          desc = "Enter the child directory, or open the file";
        }
        {
          on = "H";
          run = "plugin bypass reverse";
          desc =
            "Recursively enter parent directory, skipping parents with only a single subdirectory";
        }
        {
          on = "L";
          run = "plugin bypass";
          desc =
            "Recursively enter child directory, skipping children with only a single subdirectory";
        }
        # chmod
        {
          on = [ "c" "m" ];
          run = "plugin chmod";
          desc = "Chmod on selected files";
        }
        # jump-to-char
        {
          on = "f";
          run = "plugin jump-to-char";
          desc = "Jump to a character in the file";
        }
        # smart-filter
        {
          on = "F";
          run = "plugin smart-filter";
          desc = "Filter files in the current directory";
        }
        # ouch
        {
          on = "C";
          run = "plugin ouch zip";
          desc = "Compress the selected files";
        }
        # restore
        {
          on = [ "t" "c" ];
          run = "shell 'trash-empty' --confirm";
          desc = "Clear trash";
        }
        {
          on = [ "t" "u" ];
          run = "plugin restore";
          desc = "Restore last deleted files/folders";
        }
        # sudo
        {
          on = [ "R" "p" "p" ];
          run = "plugin sudo -- paste";
          desc = "sudo paste";
        }
        {
          on = [ "R" "P" ];
          run = "plugin sudo -- paste --force";
          desc = "sudo paste force";
        }
        {
          on = [ "R" "r" ];
          run = "plugin sudo -- rename";
          desc = "sudo rename";
        }
        {
          on = [ "R" "p" "l" ];
          run = "plugin sudo -- link";
          desc = "sudo link";
        }
        {
          on = [ "R" "p" "r" ];
          run = "plugin sudo -- link --relative";
          desc = "sudo link relative path";
        }
        {
          on = [ "R" "p" "L" ];
          run = "plugin sudo -- hardlink";
          desc = "sudo link relative path";
        }
        {
          on = [ "R" "a" ];
          run = "plugin sudo -- create";
          desc = "sudo create";
        }
        {
          on = [ "R" "d" ];
          run = "plugin sudo -- remove";
          desc = "sudo trash";
        }
        {
          on = [ "R" "D" ];
          run = "plugin sudo -- remove --permanently";
          desc = "sudo delete";
        }
        # what-size
        {
          on = [ "." "s" ];
          run = "plugin what-size --clipboard";
          desc = "Calc size of selection or cwd";
        }
        # Custom Yank
        {
          on = [ "y" "y" ];
          run = "yank";
          desc = "Yank selected files (copy)";
        }
        {
          on = [ "y" "x" ];
          run = "yank --cut";
          desc = "Yank selected files (cut)";
        }
        {
          on = [ "y" "c" ];
          run = "plugin copy-file-contents";
          desc = "Copy contents of file";
        }
        # {
        #   on = [ "y" "d" ];
        #   run = '''shell 'dragon-drop -x -i -T "$1"' --confirm''';
        #   desc = "Open dragon-drop";
        # }
        # {
        #   on = [ "y" "Y" ];
        #   run = '''shell 'for path in "$@"; do echo "file://$path"; done | wl-copy -t text/uri-list' --confirm''';
        #   desc = "Yank to system";
        # }
        {
          on = [ "p" "p" ];
          run = "paste";
          desc = "Paste yanked files";
        }
        {
          on = [ "p" "P" ];
          run = "paste --force";
          desc = "Paste yanked files (overwrite)";
        }
        {
          on = [ "p" "l" ];
          run = "link";
          desc = "Symlink the absolute path of yanked files";
        }
        {
          on = [ "p" "L" ];
          run = "link --relative";
          desc = "Symlink the relative path of yanked files";
        }
        {
          on = [ "p" "h" ];
          run = "hardlink";
          desc = "Hardlink yanked files";
        }
        # Goto
        {
          on = [ "g" "f" "f" ];
          run = "cd ~/dotfiles/";
          desc = "Go to the dotfiles directory";
        }
        {
          on = [ "g" "f" "n" ];
          run = "cd ~/dotfiles/.config/nvim/";
          desc = "Go to the neovim directory";
        }
        {
          on = [ "g" "f" "h" ];
          run = "cd ~/dotfiles/.config/hypr/";
          desc = "Go to the hyprland directory";
        }
        {
          on = [ "g" "f" "w" ];
          run = "cd ~/dotfiles/.config/waybar/";
          desc = "Go to the waybar directory";
        }
        {
          on = [ "g" "f" "y" ];
          run = "cd ~/dotfiles/.config/yazi/";
          desc = "Go to the yazi directory";
        }
        {
          on = [ "g" "w" ];
          run = "cd ~/workspace";
          desc = "Go to the workspace directory";
        }
        {
          on = [ "g" "s" ];
          run = "cd ~/software";
          desc = "Go to the software directory";
        }
        {
          on = [ "g" "p" ];
          run = "cd ~/Pictures";
          desc = "Go to the Pictures directory";
        }
        {
          on = [ "g" "h" ];
          run = "cd ~";
          desc = "Go to the home directory";
        }
        {
          on = [ "g" "c" ];
          run = "cd ~/.config";
          desc = "Go to the config directory";
        }
        {
          on = [ "g" "d" ];
          run = "cd ~/Downloads";
          desc = "Go to the downloads directory";
        }
        {
          on = [ "g" "<Space>" ];
          run = "cd --interactive";
          desc = "Go to a directory interactively";
        }
      ];
    };
  };
}
