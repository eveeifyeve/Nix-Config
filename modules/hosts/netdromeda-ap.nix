# Cudy Access Point 1
{ config, ... }:
{
  #TODO: migrate to finix.
  nixos.configurations.netdromeda-ap.module = {
    system.stateVersion = "26.11";
    nixpkgs.hostPlatform = "aarch64-linux";

    fileSystems."/" = {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };
    boot.loader.grub.devices = [ "/dev/vda" ];

    boot.kernelModules = [ "mac80211_hwsim" ];

    imports = [
      config.nixos.configurationModules.access-points
      config.nixos.modules.access-point
      config.nixos.modules.base
      config.nixos.modules.nixos
      #config.finix.modules.base
    ];

    networking.wireless.enable = false;

    services.hostapd.radios.wlan0 = {
      channel = 6;
      wifi5.enable = false;
      networks.wlan0-3 = {
        ssid = "Netdromeda-MGNT";
        bssid = "02:22:F7:02:4C:FA";
        authentication.saePasswords = [ { password = "netdromeda-mgmt"; } ];
      };
    };
  };
}
