{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
      services.hyprpaper.enable = lib.mkDefault true;
    };
}
