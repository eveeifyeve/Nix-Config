{
  nixvim.modules.base =
    { pkgs, ... }:
    {
      #TODO: migrate to tsc when https://github.com/nix-community/nixvim/pull/4560 is merged.
      plugins.lsp.servers.tsgo = {
        enable = true;
        package = pkgs.typescript;
      };
    };
}
