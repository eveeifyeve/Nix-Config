{
  homeManager.modules.gui = {
    home.shellAliases.lg = "lazygit";
    programs.lazygit = {
      enable = true;
      settings = {
        gui.switchTabsWithPanelJumpKeys = true;
      };
    };
  };
}
