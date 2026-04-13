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
  cfg = config.falak.desktop.addons.gtk;

  schema = pkgs.gsettings-desktop-schemas;
  datadir = "${schema}/share/gsettings-schemas/${schema.name}";

  reload-theme = pkgs.writeShellScriptBin "reload-theme" ''
    export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS

    gsettings set org.gnome.desktop.interface gtk-theme ""
    sleep 0.1
    gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-dark
  '';
in
{
  options.falak.desktop.addons.gtk = {
    enable = mkBoolOpt false "Whether to enable gtk theme.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      lxappearance-gtk2
      libadwaita

      # gnome.adwaita-icon-theme
      adw-gtk3

      gsettings-desktop-schemas

      reload-theme
    ];

    falak.home.extraOptions.gtk.enable = true;

    # falak.home.extraOptions.gtk = {
    #   enable = true;
    #   # font.name = "Victor Mono SemiBold 12";
    #   theme = with pkgs; {
    #     name = "adw-gtk3-dark";
    #     package = pkgs.adw-gtk3;
    #   };
    # };

    # This fixes the `no schemas installed` error with gsettings

    # falak.home.configFile."gtk-2.0".source = default.configFolder + /gtk-2.0;

    # falak.home.configFile."gtk-3.0/bookmarks".source = default.configFolder + /gtk-3.0/bookmarks;
    # falak.home.configFile."gtk-3.0/settings.ini".source = default.configFolder + /gtk-3.0/settings.ini;
    # falak.home.configFile."gtk-3.0/gtk.css".source = default.configFolder + /gtk-3.0/gtk.css;

    # falak.home.configFile."gtk-4.0/colors.css".source = default.configFolder + /gtk-3.0/colors.css;
    # falak.home.configFile."gtk-4.0/settings.ini".source = default.configFolder + /gtk-3.0/settings.ini;
  };
}
