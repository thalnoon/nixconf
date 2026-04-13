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
  cfg = config.falak.system.users;
in
{
  options.falak.system.users = {
  };

  config = {
    users.users.${default.username} = {
      createHome = true;
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "power"
        "networkmanager"
        "nix"
        "gamemode"
      ];
    };
  };
}
