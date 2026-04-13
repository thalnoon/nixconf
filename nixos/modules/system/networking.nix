{
  config,
  pkgs,
  lib,
  default,
  hostName,
  ...
}:
with lib;
with lib.falak; let
  cfg = config.falak.system.networking;
in {
  options.falak.system.networking = {
    bluetooth = mkBoolOpt false "Whether to enable bluetooth.";
  };

  config = {
    networking = {
      hostName = hostName;
      # nameservers = ["1.1.1.1" "8.8.8.8"];
      networkmanager = {
        enable = true;
        wifi = {
          powersave = false;
        };
      };

      # timeServers = options.networking.timeServers.default ++ ["pool.ntp.org"];
      # firewall = {
      #   enable = true;
      #   allowedTCPPorts = [
      #     22
      #     80
      #     443
      #     59010
      #     59011
      #     8080
      #   ];
      #   allowedUDPPorts = [
      #     59010
      #     59011
      #   ];
      # };
    };

    hardware.bluetooth.enable = cfg.bluetooth;
    services.blueman.enable = cfg.bluetooth;

    environment.systemPackages = with pkgs; [networkmanagerapplet];
  };
}
