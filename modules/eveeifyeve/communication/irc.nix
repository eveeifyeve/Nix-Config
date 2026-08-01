{ lib, ... }:
{
  home.gui =
    { config, ... }:
    {
      sops.secrets = {
        irc-password.sopsFile = ../secrets/irc-password;
        irc-key.sopsFile = ../secrets/irc-key;
        irc-cert.sopsFile = ../secrets/irc-cert;
      };

      programs.halloy.settings = {
        notifications =
          lib.genAttrs [ "direct_message" "highlight" "reaction" ] (_: {
            sound = "bloop";
            show_toast = true;
            request_attention = true;
          })
          // {
            connected.sound = "drop";
            disconnected.sound = "bonk";
          };
        servers = {
          Oftc = {
            server = "irc.oftc.net";
            nickname = "Eveeifyeve";
            port = 6697;

            sasl.external = {
              cert = config.sops.secrets.irc-cert.path;
              key = config.sops.secrets.irc-key.path;
            };
          };
          Libera = {
            server = "irc.libera.chat";
            nickname = "Eveeifyeve";
            port = 6697;
            channels = [ "#halloy" ];

            sasl.plain.password_file = config.sops.secrets.irc-password.path;
          };
        };
      };
    };
}
