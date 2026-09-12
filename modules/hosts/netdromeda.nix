{ config, ... }:
{
  nixos.configurations.netdromeda.module = nixosArgs: {
    nixpkgs.hostPlatform = "x86_64-linux";

    sops.secrets.step_ca_password = {
      owner = "step-ca";
    };

    imports = [
      config.nixos.modules.base
      config.nixos.modules.nixos
      #config.finix.modules.base
    ];

    # Services

    #TODO: migrate to modular services when ready.
    services.kea = {
      dhcp-dns = {
        enable = true;
      };
      dhcp4 = {
        enable = true;
        settings = { };
      };

      dhcp6 = {
        enable = true;
        settings = { };
      };
    };

    #TODO: migrate to modular services when ready.
    services.step-ca = {
      enable = true;
      openFirewall = true;
      port = 8443;
      address = "127.0.0.1";
      intermediatePasswordFile = config.sops.secrets.step_ca_password.path;
      settings = {
        root = "/var/data/step-ca/certs/root_ca.crt";
        crt = "/var/data/step-ca/certs/intermediate_ca.crt";
        key = "/var/data/step-ca/secrets/intermediate_ca_key";
        dnsNames = [
          "home.local"
          "machines.local"
        ];
      };
    };

    #TODO: migrate to modular services when ready.
    services.unbound = {
      enable = true;
      settings = { };
    };

    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      virtualHosts."ca.home.local" = {
        forceSSL = true;
        sslCertificate = "/var/lib/step-ca/certs/ca.home.local.crt";
        sslCertificateKey = "/var/lib/step-ca/keys/ca.home.local.key";
        locations."/" = {
          proxyPass = "http:127.0.0.1:8443";
          proxyWebsockets = true;
        };
      };

    };

    #TODO: migrate to modular services when ready.
    services.chrony = {
      enable = true;

      # Define upstream internet sources for your proxy
      servers = [
        "0.pool.ntp.org"
        "1.pool.ntp.org"
        "2.pool.ntp.org"
      ];

      # Extra configuration text appended to chrony.conf
      extraConfig = ''
        # Allow production subnet
        allow 10.0.1.0/24

        # Allow personal subnet
        allow 192.168.1.0/24

        # Fallback: keep serving local time to clients if internet goes down
        local stratum 10
      '';
    };

  };
}
