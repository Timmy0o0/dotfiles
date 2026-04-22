# Dotfile Guide

<!-- toc -->

- [Prepare](#prepare)
- [Deploy dotfiles](#deploy-dotfiles)
- [Common library](#common-library)
- [Neovim](#neovim)
- [Tmux](#tmux)
  * [Common key bindings](#common-key-bindings)

<!-- tocstop -->

## Prepare

```bash
brew install git stow
```

```bash
brew install font-jetbrains-mono-nerd-font
brew install font-maple-mono-nf-cn
```

init git

```bash
git config --global user.email "yangtmeco@outlook.com"
git config --global user.name "timmy"
```

create ssh key for github

```bash
brew install openssh
ssh-keygen -t ed25519 -C "yangtmeco@outlook.com"
cat ~/.ssh/id_ed25519.pub
```

test

```bash
ssh -T git@github.com
```

download dotfiles

```bash
cd ~
git clone https://github.com/Timmy0o0/dotfiles
```

## Deploy dotfiles

```bash
cd ~/dotfiles
just init
```

This symlinks files from `config/` to `~/.config`.

## Common library

```bash
 brew install kitty starship eza opencode fastfetch
```

Refer to the official website

- fish
- yazi
- uv
- fnm

## Neovim

1. install macism for im-select plugin
2. checkhealth

## Tmux

1. Install TPM (Tmux Plugin Manager)
2. Install plugin: Prefix `I`

### Common key bindings

| Key              | Action                                                                      |
| ---------------- | --------------------------------------------------------------------------- |
| Prefix `c`       | New window                                                                  |
| Prefix `,`       | Rename current window                                                       |
| Prefix `n` / `p` | Next window / previous window                                               |
| Prefix `0`–`9`   | Jump to window by index                                                     |
| Prefix `w`       | Window list                                                                 |
| Prefix `&`       | Kill current window (prompts for confirmation)                              |
| Prefix `%`       | Split vertically (panes left and right)                                     |
| Prefix `"`       | Split horizontally (panes stacked)                                          |
| Prefix `z`       | Zoom / unzoom current pane                                                  |
| Prefix `x`       | Kill current pane (prompts for confirmation)                                |
| Prefix `d`       | Detach from session (session keeps running)                                 |
| Prefix `s`       | Session list                                                                |
| Prefix `[`       | Enter copy mode (vi keys in this repo: `v` to start selection, `y` to copy) |
| Prefix `]`       | Paste most recent buffer                                                    |
| Prefix `?`       | List key bindings                                                           |
| Prefix `r`       | Reload `~/.config/tmux/tmux.conf` (bound in this repo)                      |
| Prefix `I`       | TPM: install plugins                                                        |
| Prefix `U`       | TPM: update plugins                                                         |
| Prefix `Alt+u`   | TPM: remove plugins not listed in `tmux.conf`                               |

This repo also uses [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): move between panes with `Ctrl+h` / `Ctrl+j` / `Ctrl+k` / `Ctrl+Left` / `Ctrl+Right`, and when Neovim is set up the same way, navigation continues seamlessly between Vim and tmux.
