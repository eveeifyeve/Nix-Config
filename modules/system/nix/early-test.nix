{
  nix.settings = {
    experimental-features = [
      "dynamic-derivations"
      "ca-derivations"
    ];
    extra-system-features = [
      "builder-rpc-v0"
    ];
  };
}
