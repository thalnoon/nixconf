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
  cfg = config.falak.services.printing;
in
{
  options.falak.services.printing = {
    enable = mkBoolOpt false "Whether to enable printing.";
  };

  config = mkIf cfg.enable {
    services = {
      printing = {
        enable = true;
        drivers = [
          # pkgs.hplipWithPlugin
        ];
      };
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };
      ipp-usb.enable = true;
    };
  };
}
