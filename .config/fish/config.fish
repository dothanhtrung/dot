if status is-interactive
    # Commands to run in interactive sessions can go here
    zoxide init fish | source
end

set -U fish_greeting ""

export EDITOR=/bin/vim
