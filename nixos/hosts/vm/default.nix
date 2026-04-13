{
  config,
  pkgs,
  lib,
  ...
}:
with lib;
with lib.falak; {
  imports = [
    ./hardware.nix
  ];

  falak.system.locale.timeZone = "Africa/Cairo";

  environment.systemPackages = with pkgs; [
    # gh
    # pavucontrol
    # mpv
    # ffmpeg
  ];

  # zenyte.home.extraOptions.programs.obs-studio.enable = true;

  falak.system.hosts.vm = {
    variant = "dark";
    type = "scheme-tonal-spot";
    wallpaper = let
      image = import ./wallpaper.nix;
    in
      falak.fetchImage image.url image.sha256;
  };

  falak.presets = {
    common = enabled;
    # development = enabled;
    # social = enabled;
    # gaming = enabled;
  };

  falak.apps = {
  };

  falak.editors = {
    neovim = enabled;
  };

  falak.system.defaultShell = pkgs.zsh;

  falak.cli.git = {
    email = "drtyvre123@gmail.com";
    name = "Noon";
  };

  falak.services = {
    syncthing = disabled;
    ly = enabled;
    # auto-cpufreq = {
    #   enable = true;
    # };
    # thermald.enable = true;
  };

  falak.desktop = {
    # xfce.enable = true;
    # awesome.enable = true;
    # kde = enabled;
    niri = enabled;
  };

  falak.browsers = {
    brave = enabled;
    # chromium = disabled;

    # firefox = {
    #   enable = true;
    #   # Default extensions: `ublock-origin`, `plasma-integration`
    #   extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    #     # bitwarden
    #   ];
    # };
  };
}
