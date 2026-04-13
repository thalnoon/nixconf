{
  config,
  pkgs,
  lib,
  default,
  inputs,
  ...
}:
with lib;
with lib.falak;
let
  cfg = config.falak.system;

  rebuild = pkgs.writeShellScriptBin "rebuild" ''
    set -euo pipefail

    sudo nixos-rebuild switch \
      --flake ${default.flakePath}/nixos \
      --no-reexec \
      --log-format internal-json \
      |& nom --json
  '';
in
{

  options.falak.system = {
    diffScript = mkBoolOpt true "Enables showing what packages changes between generations on rebuild.";
    defaultShell = mkOpt (types.enum [
      pkgs.bash
      pkgs.zsh
    ]) pkgs.zsh "Which shell to use as default.";
  };

  config = {
    users.users.${default.username} = {
      shell = cfg.defaultShell;
    };

    system.stateVersion = default.stateVersion;

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "${default.flakePath}/nixos";
    };

    environment.variables = {
      NH_OS_FLAKE = "${default.flakePath}/nixos";
    };

    # services.gvfs.enable = true;

    services.gnome.gnome-keyring.enable = true;

    environment = {
      systemPackages = with pkgs; [
        # For more information when doing nixos-rebuild
        choose
        nix-output-monitor
        rebuild

        vim
        wget
        git
        htop
        mission-center
        usbutils

        inputs.matugen.packages.${system}.default

        # Adb
        android-tools
      ];

      sessionVariables = {
        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_BIN_HOME = "$HOME/.local/bin";
        # To prevent firefox from creating ~/Desktop.
        XDG_DESKTOP_DIR = "$HOME";
        XDG_DOCUMENTS_DIR = "$HOME/docs";

        #NIXOS_OZONE_WL = "1";
      };
    };

    falak.home.extraOptions.xdg.userDirs = {
      createDirectories = true;
      enable = true;
      documents = "$HOME/docs";
      download = "$HOME/down";
      pictures = "$HOME/pics";
      videos = "$HOME/vids";
      desktop = "$HOME";
      music = "$HOME";
      templates = "$HOME";
      publicShare = "$HOME";
    };
  };
}
