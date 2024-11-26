# Description: Fish shell configuration

set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
    # Starship
    starship init fish | source
    zoxide init fish | source
end



