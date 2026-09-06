{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
      services.cliphist.enable = true;
    };
}
