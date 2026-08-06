{ inputs, lib, ... }:
lib.genAttrs [ "nixos" "darwin" ] (_: {
  modules.base =
    { pkgs, ... }:
    {
      nix.package = inputs.nix.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
})
// {
  flake-file.inputs.nix.url = "github:NixOS/nix";
}
