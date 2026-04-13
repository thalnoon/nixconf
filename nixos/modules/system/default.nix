{
  config,
  pkgs,
  lib,
  ...
}:
with lib.falak;
{
  imports = validFiles ./.;
}
