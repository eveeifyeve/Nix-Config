{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      home.packages = lib.mkIf pkgs.stdenv.hostPlatform.isLinux [
        pkgs.tor-browser
      ];
    };

  #TODO: Either support darwin bin or build from source.
  darwin.modules.gui = {
    homebrew.casks = [ "tor-browser" ];
  };
}
