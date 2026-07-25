{ config, ... }:
{
  nixos.configurations.anvil.module =
    {
      lib,
      ...
    }:
    {
      nixpkgs.hostPlatform = "x86_64-linux";
      imports = [ config.nixos.modules.iso ];
      boot.supportedFilesystems = lib.mkForce [
        "btrfs"
        "reiserfs"
        "vfat"
        "f2fs"
        "xfs"
        "ntfs"
        "cifs"
      ];
    };
}
