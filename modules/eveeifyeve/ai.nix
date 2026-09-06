{
  home.gui = hmArgs: {
    sops.secrets.openrouter-apikey-eveeifyeve.sopsFile = ./secrets/openrouter-apikey;

    programs.opencode.settings = {
      model = "alibaba/qwen3-coder-30b-a3b-instruct";
      provider.openrouter.options.apiKey = "{file:${hmArgs.config.sops.secrets.openrouter-apikey-eveeifyeve.path}}";
    };
  };
}
