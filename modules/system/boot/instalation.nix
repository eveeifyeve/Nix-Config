{
  nixos.modules.iso =
    { modulesPath, ... }:
    {
      # Yes this is not dendritic since it's using modules.. But I want to create an iso.
      imports = [ "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" ];
    };
}
