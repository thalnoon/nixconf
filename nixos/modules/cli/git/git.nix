{
  config,
  pkgs,
  lib,
  inputs,
  default,
  ...
}:
with lib;
with lib.falak;
let
  cfg = config.falak.cli.git;
in
{
  options.falak.cli.git = with types; {
    enable = mkBoolOpt false "Whether to enable git.";
    email = mkOption {
      type = str;
      default = "";
      description = ''
        The email adress that will be used.
      '';
    };
    name = mkOption {
      type = str;
      default = "";
      description = ''
        The name that will be used.
      '';
    };
  };

  config = mkIf cfg.enable {
    falak.home.extraOptions = {
      programs.git = {
        enable = true;
        settings = {
          user.email = config.falak.cli.git.email;
          user.name = config.falak.cli.git.name;
          alias = {
            s = "status";
            a = "add";
            c = "commit";
          };
        };
      };
    };
  };
}
