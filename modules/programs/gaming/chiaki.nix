{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      home.packages = lib.mkIf pkgs.stdenv.hostPlatform.isLinux [
        pkgs.chiaki-ng
      ];
    };
}
