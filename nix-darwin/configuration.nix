{ config, pkgs, ... }:

{
  # Define the user here to make it available for home-manager
  users.users.sathira = {
    name = "sathira";
    home = "/Users/sathira"; # Make sure this matches your home directory
  };

  # List of packages to install
  environment.systemPackages = with pkgs; [
    # Visual Studio Code
    vscode
    tree
    nixfmt-rfc-style # For nix formatting
    quarto # For documents
    gnupg
    zoxide
    neovim
  ];

  # Install fonts
  fonts.packages = with pkgs; [
    # Add any fonts here. E.g.,
    # cascadia-code
  ];

  # Allow non-free packages
  nixpkgs.config.allowUnfree = true;

  # Other nix-darwin options
  # You can add more configurations for your macOS system here.
  # For example:
  system.defaults.finder.AppleShowAllExtensions = true;

  #Allow key repeating rather than alternative key layout
  #"https://www.macworld.com/article/351347/how-to-activate-key-repetition-through-the-macos-terminal.html"
  # requires logging out and in
  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;

  system.defaults.CustomUserPreferences = {
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        # If these are ever changed, use `defaults read com.apple.symbolic hotkeys AppleSymbolicHotKeys`
        # or `/usr/libexec/PlistBuddy -c "Print :AppleSymbolicHotKeys" ~/Library/Preferences/com.apple.symbolichotkeys.plist`
        # to see the AppleSymbolicHotKeys that are set by manually setting the specific shortcut in System Settings: "https://stackoverflow.com/questions/21878482/what-do-the-parameter-values-in-applesymbolichotkeys-plist-dict-represent"

      };
    };
  };
}
