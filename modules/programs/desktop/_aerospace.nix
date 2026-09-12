{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      programs.aerospace = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        enable = true;
        launchd.enable = true;
      };
    };
}
