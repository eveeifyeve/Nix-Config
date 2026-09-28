{
  nix.settings = {
    substituters = [
      "http://nixpkgs-update-cache.nixos.org"
    ];
    trusted-public-keys = [
      "nixpkgs-update-cache.nix-community.org-1:U8d6wiQecHUPJFSqHN9GSSmNkmdiFW7GW7WNAnHW0SM="
    ];
  };
}
