{ lib, ... }:
{
  darwin.modules.gui = {
    homebrew.casks = [ "obs" ]; # TODO: support darwin
  };

  homeManager.modules.gui =
    { pkgs, ... }:
    {
      home.packages = lib.mkIf pkgs.stdenv.hostPlatform.isLinux [ pkgs.obs-studio ];
    };
}
