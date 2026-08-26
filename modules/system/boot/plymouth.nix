{
  nixos.modules.gui = {
    boot.plymouth = {
      enable = true;
    };
  };
}
