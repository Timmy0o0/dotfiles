# Dotfiles

<!-- toc -->

- [Git commits](#git-commits)
- [Repo layout](#repo-layout)
- [Deploy](#deploy)
- [Stow quirks](#stow-quirks)
- [Neovim](#neovim)

<!-- tocstop -->

## Git commits

Use Conventional Commits:

| Type       | Description                            |
| ---------- | -------------------------------------- |
| `feat`     | New feature                            |
| `fix`      | Bug fix                                |
| `docs`     | Documentation                          |
| `style`    | Code style (no functional change)      |
| `refactor` | Refactoring (not a fix or feature)     |
| `test`     | Testing                                |
| `chore`    | Maintenance (deps, build config, etc.) |

## Repo layout

- `config/` — each subdirectory maps to `~/.config/<name>` via GNU Stow
- Key apps: fish, nvim (LazyVim), tmux, kitty, ghostty, yazi, opencode
- `config/yazi_old/` — archived, excluded from stow via `.stow-local-ignore`

## Deploy

```bash
just init
```

Runs `stow -t ~/.config config`. Re-run after adding new top-level dirs under `config/`.

## Stow quirks

- `.stow-local-ignore` excludes `.DS_Store` and `yazi_old` from symlinking
- `.gitignore` also excludes `config/fish/completions`, `config/tmux/plugins`, `config/fish/fish_variables`, and `config/fish/conf.d/fish_frozen_*` — these are generated at runtime

## Neovim

- LazyVim distribution; plugin spec dirs: `lua/plugins/`, `lua/plugins/{ai,coding,ui,utils}/`
- Lua formatting: StyLua with spaces (2), column width 120 — defined in `config/nvim/stylua.toml`
