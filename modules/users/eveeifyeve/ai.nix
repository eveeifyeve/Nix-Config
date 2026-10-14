{
  home.gui =
    hmArgs@{ pkgs, ... }:
    {
      sops.secrets.opencode-apikey-eveeifyeve.sopsFile = ./secrets/opencode-go-apikey;

      home.file.".omp/agent/models.yml".source = (pkgs.formats.yaml { }).generate "models.yml" {
        providers.opencode-go.apiKey = "!cat ${hmArgs.config.sops.secrets.opencode-apikey-eveeifyeve.path}";
        providers.opencode-zen.apiKey = "!cat ${hmArgs.config.sops.secrets.opencode-apikey-eveeifyeve.path}";
      };

      programs.omp.settings = {
        theme.dark = "dark-catppuccin"; # TODO: switch to stylix once added a pr.
        computer.enable = true;
        github.enable = true;
        modelRoles.default = "opencode-zen/glm-5.3-flash-free:max";
      };
    };
}
