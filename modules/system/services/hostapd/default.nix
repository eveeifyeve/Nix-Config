{
  nixos.modules.access-point = {
    #TODO: migrate to modular services.
    services.hostapd.enable = true;
  };
}
