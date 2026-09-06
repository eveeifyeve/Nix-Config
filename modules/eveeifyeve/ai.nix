{
  home.gui = hmArgs: {
    sops.secrets.openrouter-apikey-eveeifyeve.sopsFile = ./secrets/openrouter-apikey;

    programs.opencode.settings = {
      model = "~z-ai/glm-flash-latest";
      small_model = "~deepseek/deepseek-v4-flash-latest";
      provider.openrouter.options.apiKey = "{file:${hmArgs.config.sops.secrets.openrouter-apikey-eveeifyeve.path}}";
    };
  };
}
