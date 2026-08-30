{ inputs, ... }:
let
  polyModule = pkgs: {
    nix.package = inputs.nix.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
in
{
  flake-file.inputs.nix.url = "github:NixOS/nix";

  darwin.modules.base = { pkgs, ... }: polyModule pkgs;
  nixos.modules.nixos = { pkgs, ... }: polyModule pkgs;
}
