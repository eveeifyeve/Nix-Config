{
  nixos.configurations.anvil.module =
    {
      lib,
      pkgs,
      modulesPath,
      ...
    }:
    {
      nixpkgs.hostPlatform = "x86_64-linux";
      imports = [
        "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
      ];
      environment.systemPackages = [ pkgs.neovim ];
      boot.kernelPackages = pkgs.linuxPackages_latest;
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
