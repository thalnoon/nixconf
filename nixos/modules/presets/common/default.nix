{
  config,
  pkgs,
  lib,
  default,
  ...
}:
with lib;
with lib.falak;
let
  cfg = config.falak.presets.common;
in
{
  options.falak.presets.common = {
    enable = mkBoolOpt false "Whether to enable the common suite.";
  };

  config = mkIf cfg.enable {
    falak.system = {
      diffScript = true;
      sound = enabled;

      networking = {
        bluetooth = true;
      };

      fonts = {
        nerd-fonts = true;
      };
    };

    falak.cli = {
      zsh = enabled;
      eza = enabled;
      fzf = enabled;
      bat = enabled;
      zoxide = enabled;
    };
  };
}
