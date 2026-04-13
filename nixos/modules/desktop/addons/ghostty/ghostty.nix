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
  cfg = config.falak.desktop.addons.kitty;
in
{
  options.falak.desktop.addons.kitty = {
    enable = mkBoolOpt false "Whether to enable kitty.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ghostty
      jq
    ];
  };
}
