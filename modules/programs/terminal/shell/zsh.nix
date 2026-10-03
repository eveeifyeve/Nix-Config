{ lib, ... }:
{
  nixos.modules.base = {
    programs.zsh.enable = true;
  };

  homeManager.modules.base =
    { pkgs, ... }:
    {
      home.shell.enableZshIntegration = true;
      programs = {
        zsh = {
          enable = true;
          oh-my-zsh = {
            enable = true;
            plugins = [ "vi-mode" ];
          };
          initContent = ''

            				${lib.getExe pkgs.fastfetch}
                    	'';
        };
      };
    };
}
