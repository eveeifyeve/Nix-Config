let

  coluumPolyModule = [
    {
      field = "number";
      title = "#";
      width = 6;
    }
    {
      field = "title";
      title = "Title";
      width = 50;
    }
    {
      field = "state";
      title = "State";
      width = 10;
    }
    {
      field = "repo";
      title = "Repo";
      width = 20;
    }
    {
      field = "author";
      title = "Author";
      width = 15;
    }
    {
      field = "updatedAt";
      title = "Updated";
      width = 15;
    }
  ];
in
{
  homeManager.modules.base =
    { pkgs, ... }:
    {
      programs.gh-dash = {
        enable = true;
        settings = {
          confirmQuit = false;
          showAuthorIcons = true;
          smartFilteringAtLaunch = true;

          prSections = [
            {
              title = "My Pull Requests";
              filters = "is:open author:@me";
              type = null;
            }
            {
              title = "Needs My Review";
              filters = "is:open review-requested:@me";
              type = null;
            }
            {
              title = "Involved";
              filters = "is:open involves:@me -author:@me";
              type = null;
            }
          ];
          issuesSections = [
            {
              title = "My Issues";
              filters = "is:open author:@me";
            }
            {
              title = "Assigned";
              filters = "is:open assignee:@me";
            }
            {
              title = "Involved";
              filters = "is:open involves:@me -author:@me";
            }
          ];
          repo.branchesRefetchIntervalSeconds = 30;
          repo.prsRefetchIntervalSeconds = 60;
          defaults = {
            refetchIntervalMinutes = 30;
            preview.open = true;
            previe.width = 50;
            prsLimit = 20;
            prApproveComment = "";
            issuesLimit = 20;
            view = "prs";
            layout = {
              prs = {
                updatedAt.width = 5;
                createdAt.width = 5;
                repo.width = 20;
                author.width = 15;
                authorIcon.hidden = false;
                lines.width = 15;
                assignees.width = 20;
                assignees.hidden = true;
                base.width = 15;
                base.hidden = true;
              };
              issues = {
                updatedAt.width = 5;
                createdAt.width = 5;
                repo.width = 15;
                creator.width = 10;
                creatorIcon.hidden = false;
                assignees.width = 20;
                assignees.hidden = true;
              };
            };
          };

          keybinds.prs = [
            {
              key = "T";
              command = "tmux new-window 'gh enhance -R {{.RepoName}} {{.PrNumber}}'";
            }
          ];

          columns = coluumPolyModule;
          prViewColumns = coluumPolyModule;
          issueViewColumns = coluumPolyModule;
        };
      };
      programs.gh = {
        enable = true;
        settings = {
          git_protocol = "ssh";
          prompt = "enabled";
          repos = [
            "nixos/nixpkgs"
            "nixos/nix"
            "dbs-org/oss"
          ];

          aliases = {
            co = "pr checkout";
            pv = "pr view";
            prs = "pr list";
            issues = "issue list";
            fork = "repo fork";
            clone = "repo clone";
          };
        };
      };

      home.packages = [ pkgs.gh-enhance ];
    };
}
