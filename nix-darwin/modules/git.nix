{ config, pkgs, ... }:

{
  # Setting up git
  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "Sathira Kulathunga";
        email = "sathira@getren.xyz"; # should be the one associated with your github account.
        signingKey = "Sathira <sathira@getren.xyz>"; # Find this using `gpg --list-secret-keys --keyid-format=long`
      };
      core = {
        editor = "vim";
      };
      init = {
        defaultBranch = "main";
      };
      commit = {
        gpgsign = true;
      };
      tag = {
        gpgsign = true;
      };
    };
  };
}
