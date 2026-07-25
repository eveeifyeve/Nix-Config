{
  nixos.modules.iso =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.neovim ];
    };
}
