{
  home.gui =
    hmArgs@{ pkgs, ... }:
    {
      sops.secrets.openrouter-apikey-eveeifyeve.sopsFile = ./secrets/openrouter-apikey;

      home.file.".omp/agent/models.yml".source = (pkgs.formats.yaml { }).generate "models.yml" {
        providers.openrouter.apiKey = "!cat ${hmArgs.config.sops.secrets.openrouter-apikey-eveeifyeve.path}";
      };

      programs.omp.settings = {
        theme.dark = "dark-catppuccin"; # TODO: switch to stylix once added a pr.
        computer.enable = true;
        github.enable = true;
        modelRoles = {
          default = "openrouter/z-ai/glm-5.3-flash:max";
          smol = "openrouter/~deepseek/deepseek-v4-flash-latest";
        };
      };
    };
}
