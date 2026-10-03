{ inputs, ... }:
{
  flake-file.inputs.omp = {
    url = "github:can1357/oh-my-pi";
    flake = false;
  };

  homeManager.modules.gui =
    { pkgs, ... }:
    {
      imports = [ (import "${inputs.omp}/nix/home-manager.nix" { self = inputs.omp; }) ]; # TODO: upstream module to home-manager.
      programs.omp = {
        enable = true;
        package = pkgs.omp;
        settings.startup = {
          quiet = true;
          checkUpdate = false;
          setupWizard = false;
        };
      };
    };
}
