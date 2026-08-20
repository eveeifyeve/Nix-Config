{ lib, ... }:
{
  home.gui =
    { pkgs, ... }:
    {
      programs.sketchybar = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        enable = true;
        service.enable = true;
      };
    };
}
