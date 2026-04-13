{
  config,
  pkgs,
  lib,
  inputs,
  options,
  default,
  hostName,
  ...
}:
with lib;
with lib.falak; let
in {
  imports = lib.falak.validFiles ./.;
}
