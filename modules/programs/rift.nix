{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      programs.rift-wm = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        enable = true;
        launchd.enable = true;
      };
    };
}
