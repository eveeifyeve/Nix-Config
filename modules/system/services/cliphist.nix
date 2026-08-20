{ lib, ... }:
{
  homeManager.modules.base =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
      services.cliphist.enable = true;
    };
}
