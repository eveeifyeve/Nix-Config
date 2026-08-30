{
  lib,
  config,
  ...
}:
{
  options.nix = {
    settings = {
      keep-outputs = lib.mkOption {
        readOnly = true;
        type = lib.types.bool;
        default = true;
      };
      accept-flake-config = lib.mkOption {
        readOnly = true;
        type = lib.types.bool;
        default = true;
      };
      always-allow-substitutes = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };

      experimental-features = lib.mkOption {
        type = lib.types.listOf lib.types.singleLineStr;
        default = [ ];
      };
      extra-system-features = lib.mkOption {
        type = lib.types.listOf lib.types.singleLineStr;
        default = [ ];
      };
    };

    polyModule = lib.mkOption {
      readOnly = true;
      type = lib.types.deferredModule;
      default = {
        nix.settings = config.nix.settings // {
          builders-use-substitutes = config.nix.settings.always-allow-substitutes;
        };
      };
    };
  };
  config = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    nixos.modules.nixos = {
      imports = [ config.nix.polyModule ];
    };

    darwin.modules.base = {
      imports = [ config.nix.polyModule ];
      nix.linux-builder.config.nix = {
        inherit (config.nix) settings;
      };
    };
  };
}
