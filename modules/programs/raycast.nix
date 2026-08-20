{ lib, ... }:
{
  nixpkgs.config.allowUnfreePackages = [ "raycast" ];
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      home.packages = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin [ pkgs.raycast ];
    };
}
