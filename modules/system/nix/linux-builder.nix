{
  darwin.modules.base =
    { pkgs, ... }:
    {
      nix.linux-builder = {
        enable = true;
        package = pkgs.darwin.linux-builder;
        ephemeral = true;
        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
        config.boot.binfmt.emulatedSystems = [ "x86_64-linux" ];
      };
    };
}
