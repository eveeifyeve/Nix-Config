{ inputs, ... }:
{
  flake-file.inputs.impermanence.url = "github:nix-community/impermanence";

  nixos.modules.desktop = {
    imports = [ inputs.impermanence.nixosModules.impermanence ];

    disko.devices.disk.main.content.partitions.root.contents.subvolumes = {
      "/nix" = {
        mountpoint = "/nix";
        mountOptions = [
          "compress=zstd"
          "noatime"
        ];
      };
      "/persist" = {
        mountpoint = "/persist";
        mountOptions = [
          "compress=zstd"
          "noatime"
        ];
      };
    };
  };
}
