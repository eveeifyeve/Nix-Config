{ inputs, ... }:
{
  flake-file.inputs.vicinae.url = "github:vicinaehq/vicinae";

  homeManager.modules.gui =
    { pkgs, ... }:
    {
      imports = [ inputs.vicinae.homeManagerModules.default ];

      programs.vicinae = {
        enable = true;
        package = pkgs.vicinae;
        settings.telemetry.system_info = false; # Turn off the stupid telemetry.

        # Service
        launchd.enable = pkgs.stdenv.hostPlatform.isDarwin;
        systemd = {
          enable = pkgs.stdenv.hostPlatform.isLinux;
          environment.USE_LAYER_SHELL = 1;
        };
      };
    };
}
