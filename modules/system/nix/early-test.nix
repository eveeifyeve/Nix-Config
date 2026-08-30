{
  nix.settings = {
    experimental-features = [
      "dynamic-derivations"
      "external-builders"
      "ca-derivations"
    ];
    extra-system-features = [
      "builder-rpc-v0"
    ];
  };
}
