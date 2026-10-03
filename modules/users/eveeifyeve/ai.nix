{
  home.gui =
    hmArgs@{ pkgs, ... }:
    {
      sops.secrets.opencode-go-apikey-eveeifyeve.sopsFile = ./secrets/opencode-go-apikey;

      home.file.".omp/agent/models.yml".source = (pkgs.formats.yaml { }).generate "models.yml" {
        providers.opencode.apiKey = "!cat ${hmArgs.config.sops.secrets.opencode-go-apikey-eveeifyeve.path}";
      };

      programs.omp.settings = {
        theme.dark = "dark-catppuccin"; # TODO: switch to stylix once added a pr.
        computer.enable = true;
        github.enable = true;
        modelRoles.default = "glm-5.3-flash:max";
      };
    };
}
