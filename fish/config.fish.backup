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

# Notify when a long-running command (60s+) finishes
function __notify_long_command --on-event fish_postexec
    # $CMD_DURATION is in milliseconds
    set threshold 60000

    if test $CMD_DURATION -gt $threshold
        set elapsed (math -s3 "$CMD_DURATION / 1000")

        # macOS notification
        if test (uname) = Darwin
            osascript -e "display notification \"Finished in $elapsed seconds\" with title \"Command Completed\""
            # Linux (notify-send)
        else if type -q notify-send
            notify-send "Command Completed" "Finished in $elapsed seconds"
        end
    end
end

# pnpm
set -gx PNPM_HOME /Users/sathira/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
fish_add_path $HOME/.local/bin
