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
        nix.settings = config.nix.settings;
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
    };
  };
}
