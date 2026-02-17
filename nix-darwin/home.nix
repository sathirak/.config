{
  config,
  pkgs,
  ...
}:

{
  # Allow non-free packages
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./modules/yazi.nix
    ./modules/rust.nix
    ./modules/git.nix
    ./modules/python.nix
    ./modules/code.nix
    ./modules/zoxide.nix
    ./modules/neovim.nix
    ./modules/ssh.nix
  ];

  home.stateVersion = "25.05";
}
