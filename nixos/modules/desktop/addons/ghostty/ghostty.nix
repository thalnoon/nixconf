{
  config,
  pkgs,
  lib,
  default,
  ...
}:
with lib;
with lib.falak; let
  cfg = config.falak.desktop.addons.ghostty;
in {
  options.falak.desktop.addons.ghostty = {
    enable = mkBoolOpt false "Whether to enable ghostty.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ghostty
      jq
    ];
  };
}
