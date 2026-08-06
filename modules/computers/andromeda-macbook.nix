{ config, ... }:
{
  darwin.configurations.andromeda-macbook.module = {
    nixpkgs.hostPlatform.system = "aarch64-darwin";
    nix.settings.trusted-users = [
      "root"
      "@admin"
    ];
    system.stateVersion = 7;
    imports = with config.darwin.modules; [
      base
      gui
    ];
  };
}
