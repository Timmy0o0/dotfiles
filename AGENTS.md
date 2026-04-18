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