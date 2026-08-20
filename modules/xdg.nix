{ lib, ... }:
{
  homeManager.modules.base =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
      xdg = {
        enable = true;
        mime.enable = true;
        mimeApps.enable = true;
      };
    };
}
