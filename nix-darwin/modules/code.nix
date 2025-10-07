{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    profiles.default = {
      userSettings = {
        "editor.formatOnSave" = true;
      };
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
      ];
    };
  };
}
