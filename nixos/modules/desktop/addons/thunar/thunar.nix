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
  cfg = config.falak.desktop.addons.thunar;
in
{
  options.falak.desktop.addons.thunar = {
    enable = mkBoolOpt false "Whether to enable thunar.";
  };

  config = mkIf cfg.enable {
    programs.thunar.enable = true;
    programs.thunar.plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
}
