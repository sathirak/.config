{ config, pkgs, ... }:

{
  # Setting up git
  programs.git = {
    enable = true;
    extraConfig = {
      user = {
        name = "Sathira Kulathunga";
        # email = "email@email.com"; # should be the one associated with your github account.
        # signingKey = "Sathira <email@email.com>"; # Find this using `gpg --list-secret-keys --keyid-format=long`
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
