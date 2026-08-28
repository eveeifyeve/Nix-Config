{
  darwin.modules.base = {
    nix.linux-builder = {
      enable = true;
      ephemeral = true;
      # systems = [
      #   "x86_64-linux"
      #   "aarch64-linux"
      # ];
      # config.boot.binfmt.emulatedSystems = [ "x86_64-linux" ];
    };
  };
}
