{
  mgr.prepend_keymap = [
    # bypass
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
      run = "cd ~/dotfiles/config/nvim/";
      desc = "Go to the neovim directory";
    }
    {
      on = [ "g" "w" ];
      run = "cd ~/workspace";
      desc = "Go to the workspace directory";
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
}
