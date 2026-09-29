{ inputs, ... }:
{
  flake-file.inputs.vicinae-extensions.url = "github:vicinaehq/extensions";

  home.gui =
    { pkgs, ... }:
    {
      programs.vicinae.settings = {
        settings.global_shortcuts.toggle =
          if pkgs.stdenv.hostPlatform.isDarwin then "control+space" else "super+space";
        settings.providers = {
        };

        extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
          coffee
          workspace
        ];
      };
    };
}
