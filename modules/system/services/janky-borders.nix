{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      # TODO: stylix support
      services.jankyborders = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        enable = true;
        settings = {
          style = "round";
          hidpi = "on";
        };
      };
    };
}
