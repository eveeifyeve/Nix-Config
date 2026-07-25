{
  homeManager.modules.base =
    { pkgs, ... }:
    {
      programs.gh-dash = {
        enable = true;
        settings.keybinds.prs = [
          {
            key = "T";
            command = "tmux new-window 'gh enhance -R {{.RepoName}} {{.PrNumber}}'";
          }
        ];
      };
      programs.gh = {
        enable = true;
        settings = {
          git_protocol = "ssh";
          prompt = "enabled";

          aliases = {
            co = "pr checkout";
            pv = "pr view";
          };
        };
      };

      home.packages = [ pkgs.gh-enhance ];
    };
}
