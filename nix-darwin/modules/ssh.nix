{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    # Add 1Password config here manually
    extraConfig = ''
      Host *
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
        
      Host lab.ren.lk 
        ProxyCommand cloudflared access ssh --hostname %h
    '';

  };

  home.packages = [ pkgs.cloudflared ];
}
