{ inputs, ... }:
{
  flake-file.inputs.direnv-instant.url = "github:Mic92/direnv-instant";

  homeManager.modules.gui = {
    imports = [
      inputs.direnv-instant.homeModules.direnv-instant
    ];

    programs.direnv-instant.enable = true; # Automatically enables direnv
    programs.direnv.nix-direnv.enable = true;
  };
}
