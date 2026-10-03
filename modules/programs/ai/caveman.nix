{ inputs, ... }:
{
  flake-file.inputs.caveman = {
    url = "github:JuliusBrussee/caveman";
    flake = false;
  };

  # Caveman skills mounted as omp user skills (~/.omp/agent/skills/<name>/).
  homeManager.modules.gui = {
    home.file = builtins.listToAttrs (
      map
        (name: {
          name = ".omp/agent/skills/${name}";
          value.source = "${inputs.caveman}/skills/${name}";
        })
        [
          "cavecrew"
          "caveman-commit"
          "caveman-compress"
          "caveman-help"
          "caveman-review"
          "caveman-stats"
          "caveman"
        ]
    );
  };
}
