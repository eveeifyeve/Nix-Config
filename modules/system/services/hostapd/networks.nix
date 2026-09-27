{
  nixos.configurationModules.access-points = {
    services.hostapd.radios.wlan0 = {
      countryCode = "AU";
      networks = {
        wlan0 = {
          ssid = "Netdromeda-Home";
          bssid = "02:E9:7F:2B:50:00";
          apIsolate = true;
          authentication.saePasswords = [ { password = "netdromeda-home"; } ];
        };

        wlan0-1 = {
          ssid = "Netdromeda-Guest";
          bssid = "02:22:F7:02:4C:F8";
          apIsolate = true;
          authentication.saePasswords = [ { password = "netdromeda-guest"; } ];
        };

        wlan0-2 = {
          ssid = "Netdromeda-Iot";
          bssid = "02:22:F7:02:4C:F9";
          apIsolate = true;
          authentication.saePasswords = [ { password = "netdromeda-iot"; } ];
        };
      };
    };
  };
}
