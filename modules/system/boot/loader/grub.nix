{
  nixos.modules.nixos =
    { pkgs, ... }:
    {
      boot.loader.grub = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        memtest86.enable = (pkgs.stdenv.hostPlatform.isx86_64 || pkgs.stdenv.hostPlatform.isi686);
      };
    };
}
