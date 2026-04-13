{
  config,
  pkgs,
  lib,
  default,
  ...
}:
with lib;
with lib.falak; let
  cfg = config.falak.cli.zoxide;
in {
  options.falak.cli.zoxide = {
    enable = mkBoolOpt false "Whether to enable zoxide as an alias for ls.";
  };

  config = mkIf cfg.enable {
    falak.home.extraOptions = {
      programs = {
        zoxide = {
          enable = true;
          enableZshIntegration = true;
          enableBashIntegration = true;
          options = [
            "--cmd cd"
          ];
        };
      };
    };
  };
}
