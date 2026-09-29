{
  inputs,
  lib,
  ...
}:
{
  imports = [ inputs.flake-file.flakeModules.default ];

  flake-file.auto-follow.enable = lib.mkDefault true;
  flake-file.inputs = {
    flake-file.url = "github:denful/flake-file";
    import-tree.url = "github:denful/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
}
