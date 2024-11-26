# -----------------------------------------------------
# ENV VARS
# -----------------------------------------------------
set -x EDITOR nvim

# pnpm
set -gx PNPM_HOME "/home/timmy/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
