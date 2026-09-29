{ lib, inputs, ... }:
{
  flake-file.inputs.hyprland-scroll-overview.url = "github:yayuuu/hyprland-scroll-overview";

  homeManager.modules.gui =
    { pkgs, ... }:
    lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
      wayland.windowManager.hyprland.plugins = [
        inputs.hyprland-scroll-overview.packages.${pkgs.stdenv.hostPlatform.system}.scrolloverview
      ];
    };
}
