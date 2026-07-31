{
  # nixpkgs.config.allowUnfreePackages = [
  #   "modrinth-app-unwrapped"
  #   "modrinth-app"
  # ];

  homeManager.modules.gui =
    { pkgs, ... }:
    let
      nixpkgs-pr-drv = pkgs.applyPatches {
        src = pkgs.path;
        patches = [
          (pkgs.fetchpatch2 {
            url = "https://github.com/NixOS/nixpkgs/pull/542808.patch";
            hash = "sha256-0IsQcvpyxroH6+dXBCxKDVTi1IZXFGCYXX/MMR3jVA4=";
          })
        ];
      };
      nixpkgs-pr = import nixpkgs-pr-drv {
        inherit (pkgs.stdenv) system;
        config.allowUnfreePackages = [
          "modrinth-app-unwrapped"
          "modrinth-app"
        ];
      };
    in
    {
      home.packages = [
        nixpkgs-pr.modrinth-app
      ];
    };
}
