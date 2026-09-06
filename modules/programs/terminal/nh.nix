{
  homeManager.modules.gui = {
    programs.nh = {
      enable = true;
      flake = "/etc/nixos";
      clean.enable = true;
    };
  };
}
