{ config, ... }:
{
  nixos.configurations.netdromeda.module = {
    nixpkgs.hostPlatform = "x86_64-linux";

    imports = [
      config.nixos.modules.base
      config.nixos.modules.nixos
      #config.finix.modules.base
    ];
  };
}
