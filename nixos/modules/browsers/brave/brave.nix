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
  cfg = config.falak.browsers.brave;
in
{
  options.falak.browsers.brave = {
    enable = mkBoolOpt false "Whether to enable brave.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      brave
    ];
  };
}
