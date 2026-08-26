{ config, ... }:
{
  finix.configurations.netdromeda.module = {
    nixpkgs.hostPlatform = "x86_64-linux";
    imports = [ config.nixos.modules.base ];
  };
}
