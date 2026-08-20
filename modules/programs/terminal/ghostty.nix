{ lib, ... }:
{
  homeManager.modules.gui =
    { pkgs, config, ... }:
    {
      programs.ghostty = {
        enable = true;
        package = if pkgs.stdenv.hostPlatform.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
        settings = {
          window-decoration = lib.optionalString pkgs.stdenv.hostPlatform.isDarwin "none";
          macos-titlebar-style = lib.optionalString pkgs.stdenv.hostPlatform.isDarwin "hidden";
          macos-option-as-alt = lib.optional pkgs.stdenv.hostPlatform.isDarwin true;
          background-blur = true;
        };
      };

      programs.tmux.extraConfig = "set -g @continuum-boot-options '${config.programs.ghostty.package}'";
    };
}
