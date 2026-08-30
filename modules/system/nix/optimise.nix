{
  nixos.modules.nixos = {
    nix.optimise.automatic = true;
  };

  darwin.modules.base = {
    nix.optimise.automatic = true;
  };
}
