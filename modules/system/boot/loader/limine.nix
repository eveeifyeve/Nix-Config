{
  finix.modules.base =
    { pkgs, ... }:
    {
      boot.loader.limine = {
        enable = true;
        efiSupport = true;
        efiInstallAsRemovable = true;

        # Memtest86+
        extraFiles = {
          "EFI/memtest86plus/BOOTX64.EFI" = "${pkgs.memtest86plus}/memtest.efi";
        };

        extraEntries = ''
          /:Memtest86+
              comment: Memory Test Utility
              protocol: efi
              path: boot():/EFI/memtest86plus/BOOTX64.EFI
        '';
      };
    };
}
