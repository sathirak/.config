if status is-interactive
    # Commands to run in interactive sessions can go here
end

eval "$(/opt/homebrew/bin/brew shellenv)"

alias nixup="sudo darwin-rebuild switch --flake ~/.config/nix-darwin"

alias c=code

alias cl=clear

alias n=nvim

zoxide init fish | source
