{ inputs, ... }: {
  flake-file.inputs.nix-output-monitor.url = "github:xokdvium/nix-output-monitor/fetch-to-store-activity";
  nixpkgs.overlays = [
    inputs.nix-output-monitor.overlays.default
  ];
}
