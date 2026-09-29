{
  nixpkgs.config.allowUnfreePackages = [ "intellij-idea" ];
  homeManager.modules.gui =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.intellij-idea ];
    };
}
