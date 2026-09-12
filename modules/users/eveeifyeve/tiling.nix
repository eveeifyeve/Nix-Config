{ lib, ... }:
{
  home.gui =
    { pkgs, config, ... }:
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        programs.rift-wm.config = {
          settings.layout = {
            mode = "scrolling";
            gaps =
              let
                generalgap = 15;
              in
              {
                inner = {
                  horizontal = generalgap;
                  vertical = generalgap;
                };

                outer = {
                  left = generalgap + 55;
                  bottom = generalgap;
                  top = generalgap;
                  right = generalgap;
                };
              };
          };

          virtual_workspaces = {
            default_workspace_count = 9;
            workspace_names = [ ];
          };

          keys = {
            "Alt + T".exec = "ghostty";
            "Alt + Shift + F" = "toggle_fullscreen";
            "Alt + Shift + H ".move_node = "left";
            "Alt + Shift + J".move_node = "down";
            "Alt + Shift + K".move_node = "up";
            "Alt + Shift + L".move_node = "right";
            "Alt + H ".move_node = "left";
            "Alt + J".move_node = "down";
            "Alt + K".move_node = "up";
            "Alt + L".move_node = "right";
          };
        };
      })
      (lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        wayland.windowManager.hyprland.settings = {
          general.gaps_in = 15;
          general.gaps_out = "70,15,15,15";
          decoration = {
            rounding = 5;
          };

          dwindle = {
            precise_mouse_move = true;
            preserve_split = true;
            force_split = 2;
            split_bias = 1;
          };

          input.follow_mouse = 1;
          bind = [
            "$mainMod, T, exec, ${config.programs.ghostty.package}"

            "$mainMod, H, movefocus, l"
            "$mainMod, J, movefocus, d"
            "$mainMod, K, movefocus, u"
            "$mainMod, L, movefocus, r"

            "$mainMod SHIFT, H, movewindow, l"
            "$mainMod SHIFT, J, movewindow, d"
            "$mainMod SHIFT, K, movewindow, u"
            "$mainMod SHIFT, L, movewindow, r"

            "$mainMod, F, fullscreen, 1"
            "$mainMod SHIFT, F, fullscreen, 2"

            # Layout Switching & Tiling.
            "$mainMod SHIFT, 1, exec, hyprctl keyword general:layout dwindle"
            "$mainMod SHIFT, 2, exec, hyprctl keyword general:layout master"
            "$mainMod SHIFT, 3, exec, hyprctl keyword general:layout togglesplit"
            "$mainMod, P, pseudo"
            "Print, exec, ${lib.getExe pkgs.grim} - | ${lib.getExe pkgs.satty} -f - --copy-command ${pkgs.wl-clipboard-rs}/bin/wl-copy -o '~/Pictures/Screenshots/%Y%m%d_%H%M%S.png'"
          ];
        };
      })
    ];
}
