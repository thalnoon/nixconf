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
  cfg = config.falak.desktop.niri;

  wallpaper =
    if builtins.hasAttr "wallpaper" options.falak.system.hosts.${hostName}
    then config.falak.system.hosts.${hostName}.wallpaper
    else default.wallpaper;
in {
  options.falak.desktop.niri = {
    enable = mkBoolOpt false "Whether to enable Niri, with other desktop addons.";
    nvidiaPatches = mkBoolOpt false "Whether to enable nvidia patches for Niri.";
  };

  config = mkIf cfg.enable {
    home-manager.sharedModules = [
      inputs.niri.homeModules.niri
    ];

    programs.niri.enable = true;

    # programs.gpu-screen-recorder.enable = true;

    falak.home.extraOptions = {
      programs.niri = {
        enable = true;
      };
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      USE_WAYLAND = "1";
    };

    environment.systemPackages = with pkgs; [
      wl-clipboard
      wl-clip-persist
      cliphist
      # grim
      # slurp
      playerctl
      # inputs.nixpkgs-wayland.packages.${system}.wl-gammarelay-rs
      # inputs.nixpkgs-wayland.packages.${system}.swww
      # wf-recorder
      awww

      # hyprshot
      # hyprpicker

      adwaita-icon-theme
      hicolor-icon-theme

      imagemagick

      # For theme management
      nwg-look

      # Cursor theme
      # inputs.mcmojave-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
      bibata-cursors

      # gpu-screen-recorder-gtk
      # (pkgs.runCommand "gpu-screen-recorder" {
      #     nativeBuildInputs = [pkgs.makeWrapper];
      #   } ''
      #     mkdir -p $out/bin
      #     makeWrapper ${pkgs.gpu-screen-recorder}/bin/gpu-screen-recorder $out/bin/gpu-screen-recorder \
      #       --prefix LD_LIBRARY_PATH : ${pkgs.libglvnd}/lib \
      #       --prefix LD_LIBRARY_PATH : ${config.boot.kernelPackages.nvidia_x11}/lib
      #   '')
    ];

    falak.desktop.addons = {
      ghostty = enabled;
      # rofi = enabled;
      gtk = enabled;
      nautilus = enabled;
      thunar = disabled;
      qt = enabled;
      noctalia = enabled;
      # sddm = enabled;
    };

    falak.cli = {
      # neofetch = enabled;
      starship = enabled;
    };

    falak.services = {
      # flatpak = enabled;
      ly = enabled;
    };

    # falak.home.configFile."hypr".source = default.configFolder + /hypr;
    # falak.home.configFile."hypr/icons".source = default.configFolder + /hypr/icons;
    # falak.home.configFile."hypr/scripts".source = default.configFolder + /hypr/scripts;
    # falak.home.configFile."hypr/wallpapers".source = default.configFolder + /hypr/wallpapers;
    # falak.home.configFile."hypr/hyprland.conf".source = default.configFolder + /hypr/hyprland.conf;
    # falak.home.configFile."hypr/keybindings.conf".source = default.configFolder + /hypr/keybindings.conf;
  };
}
