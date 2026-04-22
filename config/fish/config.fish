if status is-interactive
    set -gx EDITOR nvim
    set -gx VISUAL nvim
end

alias c="clear"
alias lg="lazygit"
alias oc="opencode --port"
alias ls="eza --icons"
alias ll="eza -l --icons --git"
alias la="eza -la --icons --git"
alias tree="eza --tree --icons"
alias ff="fastfetch"
