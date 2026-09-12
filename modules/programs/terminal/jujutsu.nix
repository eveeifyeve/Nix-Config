{ inputs, config, ... }:
{
  flake-file.inputs.jj-gh = {
    url = "github:mrjones2014/jj-gh";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.treefmt-nix.follows = "treefmt";
  };

  home.gui = {
    programs.jujutsu.settings.user = { inherit (config.users.eveeifyeve) name email; };
  };

  homeManager.modules.gui = {
    imports = [ inputs.jj-gh.homeManagerModules.default ];
    programs.jujutsu = {
      enable = true;
      gh = {
        enable = true;
        settings = {
          upstream_remote = "upstream";
          auto_push = true;
          gh_askpass = [
            "gh"
            "auth"
            "token"
          ];
        };
      };

      settings.aliases = {
        # st = "status -s";
        # sta = "status";
        # ci = "commit";
        # co = "checkout";
        # cod = "checkout .";
        # rh = "reset HEAD";
        # aa = "add -A";
        # cdf = "clean -df";
        # pr = "pull --rebase";
        # br = "branch";
        # bra = "branch -a";
        # amend = "commit -a --amend --no-edit";
        # ciam = "commit -a --amend --no-edit";
        #
        # ei = "add --intent-to-add";
        # eu = "update-index --assume-unchanged";
        # co-author =
        #   "!co() {"
        #   + " curl --request GET"
        #   + " --header 'Accept: application/vnd.github+json'"
        #   + " --url \"https://api.github.com/users/$@\""
        #   + " | jq --raw-output"
        #   + " '\"Co-authored-by: \\(.name // .login)"
        #   + " <\\(.id)+\\(.login)@users.noreply.github.com>\"'"
        #   + " ;};"
        #   + " co";
      };
    };
  };
}
