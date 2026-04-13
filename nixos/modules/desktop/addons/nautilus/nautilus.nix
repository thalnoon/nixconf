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
  cfg = config.falak.desktop.addons.nautilus;
in
{
  options.falak.desktop.addons.nautilus = {
    enable = mkBoolOpt false "Whether to enable nautilus.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nautilus

      # For thumbnails
      libheif
      libheif.out

      # For images
      loupe
    ];

    environment.pathsToLink = [ "share/thumbnailers" ];

    services.gvfs.enable = true;
    services.udisks2.enable = true;
  };
}
