{
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.nix-output-monitor ];
    };
}
