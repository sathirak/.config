if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

alias nixup="sudo darwin-rebuild switch --flake ~/.config/nix-darwin"

alias c=code

alias cl=clear

alias n=nvim

alias lg=lazygit

zoxide init fish | source

# pnpm
set -gx PNPM_HOME /Users/sathira/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
