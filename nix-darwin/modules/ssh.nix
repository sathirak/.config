{ config, ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
        # Path must be quoted in SSH config (contains space in "Group Containers")
        identityAgent = [ "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"" ];
      };
    };
  };

  # Start ssh-agent and add key in every new terminal so Git SSH signing works
  # without running eval (ssh-agent -c) and ssh-add manually.
  programs.fish = {
    enable = true;
    shellAliases = {
      nixup = "sudo darwin-rebuild switch --flake ~/.config/nix-darwin";
      c = "code";
      cl = "clear";
      n = "nvim";
      lg = "lazygit";
    };
    functions = {
      __notify_long_command = {
        body = ''
          set threshold 60000
          if test $CMD_DURATION -gt $threshold
            set elapsed (math -s3 "$CMD_DURATION / 1000")
            if test (uname) = Darwin
              osascript -e "display notification \"Finished in $elapsed seconds\" with title \"Command Completed\""
            else if type -q notify-send
              notify-send "Command Completed" "Finished in $elapsed seconds"
            end
          end
        '';
        onEvent = "fish_postexec";
      };
    };
    interactiveShellInit = ''
      # Single persistent ssh-agent (shared across terminals) for Git SSH signing
      set -gx SSH_AUTH_SOCK $HOME/.ssh/agent.sock
      if not ssh-add -l >/dev/null 2>&1
        eval (ssh-agent -a $SSH_AUTH_SOCK -c)
        ssh-add --apple-use-keychain $HOME/.ssh/id_ed25519
      end

      eval "$(/opt/homebrew/bin/brew shellenv)"
      zoxide init fish | source

      # pnpm
      set -gx PNPM_HOME /Users/sathira/Library/pnpm
      if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
      end
      fish_add_path $HOME/.local/bin
    '';
  };
}
