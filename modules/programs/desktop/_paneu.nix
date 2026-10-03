{ lib, inputs, ... }:
{
  flake-info.imputs.paneru.url = "github:karinushka/paneru";
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      imports = [
        inputs.paneru.homeModules.paneru
      ];
      services.paneru = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        enable = true;
      };
    };
}
