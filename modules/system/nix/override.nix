{ inputs, lib, ... }:
let
  polyModule = pkgs: {
    nix.package =
      ((inputs.nix.lib.makeComponents { inherit pkgs; }).overrideScope (
        _: _: {
          boost =
            (pkgs.boost189.override {
              extraB2Args = [
                "--with-container"
                "--with-context"
                "--with-coroutine"
                "--with-iostreams"
                "--with-url"
              ];
              enableIcu = false;
            }).overrideAttrs
              (old: {
                # Need to remove `--with-*` to use `--with-libraries=...`
                buildPhase = lib.replaceStrings [ "--without-python" ] [ "" ] old.buildPhase;
                installPhase = lib.replaceStrings [ "--without-python" ] [ "" ] old.installPhase;
              });
        }
      )).nix-everything;
  };
in
{
  flake-file.inputs.nix.url = "github:NixOS/nix";

  darwin.modules.base = { pkgs, ... }: polyModule pkgs;
  nixos.modules.nixos = { pkgs, ... }: polyModule pkgs;
}
