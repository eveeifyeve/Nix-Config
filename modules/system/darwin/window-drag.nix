{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
      targets.darwin.defaults.NSGlobalDomain.NSWindowShouldDragOnGesture = true;
    };
}
