# Dotfiles

This is a dotfiles repository managed with GNU Stow.

## Deploy dotfiles

```bash
just init
```

This symlinks files from `config/` to `~/.config`.

## Add a new config

1. Create config directory under `config/`
2. Run `just init`
3. Files are automatically stowed to `~/.config/<dir>/`

## Tmux

1. Install TPM (Tmux Plugin Manager)
2. Install plugin: Prefix + I

### Common key bindings

| Key | Action |
|-----|--------|
| Prefix `c` | New window |
| Prefix `,` | Rename current window |
| Prefix `n` / `p` | Next window / previous window |
| Prefix `0`–`9` | Jump to window by index |
| Prefix `w` | Window list |
| Prefix `&` | Kill current window (prompts for confirmation) |
| Prefix `%` | Split vertically (panes left and right) |
| Prefix `"` | Split horizontally (panes stacked) |
| Prefix `z` | Zoom / unzoom current pane |
| Prefix `x` | Kill current pane (prompts for confirmation) |
| Prefix `d` | Detach from session (session keeps running) |
| Prefix `s` | Session list |
| Prefix `[` | Enter copy mode (vi keys in this repo: `v` to start selection, `y` to copy) |
| Prefix `]` | Paste most recent buffer |
| Prefix `?` | List key bindings |
| Prefix `r` | Reload `~/.config/tmux/tmux.conf` (bound in this repo) |
| Prefix `I` | TPM: install plugins |
| Prefix `U` | TPM: update plugins |
| Prefix `Alt+u` | TPM: remove plugins not listed in `tmux.conf` |

This repo also uses [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator): move between panes with `Ctrl+h` / `Ctrl+j` / `Ctrl+k` / `Ctrl+Left` / `Ctrl+Right`, and when Neovim is set up the same way, navigation continues seamlessly between Vim and tmux.

## Git Commit Convention (Conventional Commits)

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `docs` | Documentation |
| `style` | Code style (no functional change) |
| `refactor` | Refactoring (not a fix or feature) |
| `test` | Testing |
| `chore` | Maintenance (deps, build config, etc.) |

Example: `feat: add user login functionality`

## Tmux config
