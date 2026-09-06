{
  homeManager.modules.gui = {
    programs.opencode = {
      enable = true;
      enableMcpIntegration = true;
      settings = {
        autoshare = false;
        autoupdate = false;
        instructions = [
          "CONTRIBUTING.md"
          "docs/guidelines.md"
          "docs/CONTRIBUTING.md"
        ];
      };
    };
  };
}
