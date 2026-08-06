{
  homeManager.modules.base =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.mob ];
    };
}
