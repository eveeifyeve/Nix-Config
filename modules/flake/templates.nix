let
  devEnvTemplates = ../../devenviron-templates;
in
{
  flake.templates = {
    # Dev environment Templates
    node = {
      path = "${devEnvTemplates}/node";
      description = "Node template";
    };

    python = {
      path = "${devEnvTemplates}/python";
      description = "Python template";
    };

    rust = {
      path = "${devEnvTemplates}/rust";
      description = "Rust template";
    };

    zig = {
      path = "${devEnvTemplates}/zig";
      description = "Zig template";
    };

    java = {
      path = "${devEnvTemplates}/java";
      description = "Java Template";
    };

    option-helpers = {
      path = ../option-helpers;
      description = "Some very useful option module helpers.";
    };
  };
}
