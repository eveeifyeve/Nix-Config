{
  inputs,
  ...
}:
{

  flake-file.inputs.disko.url = "github:nix-community/disko/latest";

  nixos.modules.nixos = inputs.disko.nixosModules.disko;
}
