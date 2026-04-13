{
  config,
  pkgs,
  lib,
  inputs,
  nixpkgs,
  default,
  ...
}:
with lib;
with lib.falak;
let
  cfg = config.falak.desktop.addons.noctalia;
  system = pkgs.stdenv.hostPlatform.system;
  noctaliaPkg = inputs.noctalia.packages.${system}.default;
  configDir = "${noctaliaPkg}/share/noctalia-shell";
in
{
  options.falak.desktop.addons.noctalia = {
    enable = mkBoolOpt false "Whether to enable noctalia.";
  };

  config = mkIf cfg.enable {
    # services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    home.packages = [
      pkgs.quickshell
      noctaliaPkg
    ];

    # Seed the configuration
    home.activation.seedNoctaliaShellCode = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      set -eu
      DEST="$HOME/.config/quickshell/noctalia-shell"
      SRC="${configDir}"

      if [ ! -d "$DEST" ]; then
        $DRY_RUN_CMD mkdir -p "$HOME/.config/quickshell"
        $DRY_RUN_CMD cp -R "$SRC" "$DEST"
        $DRY_RUN_CMD chmod -R u+rwX "$DEST"
      fi
    '';
  };
}
