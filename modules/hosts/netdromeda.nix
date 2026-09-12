{ config, ... }:
{
  nixos.configurations.netdromeda.module = nixosArgs: {
    nixpkgs.hostPlatform = "x86_64-linux";

    sops.secrets.step_ca_password = {
      owner = "step-ca";
    };

    imports = [
      config.nixos.modules.base
      config.nixos.modules.nixos
      #config.finix.modules.base
    ];
