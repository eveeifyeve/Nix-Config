{ lib, ... }:
{
  home.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
      targets.darwin.defaults."com.apple.dock" = {
        autohide = true;
        show-recents = false;
        persistent-apps = [ ];
      };
    };
}
