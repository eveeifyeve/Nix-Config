{ inputs, config, ... }:
{
  finix.configurations.netdromeda.module = {
    #nixpkgs.hostPlatform = "x86_64-linux";

    nixpkgs.pkgs = import inputs.nixpkgs (
      {
        system = "x86_64-linux";
      }
      // config.nixpkgs.args
    );

    imports = [
      config.nixos.modules.base
      config.finix.modules.base
    ];
  };
}
