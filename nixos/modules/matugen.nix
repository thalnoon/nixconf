{
  inputs,
  config,
  lib,
  options,
  default,
  hostName,
  impurity,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.falak.home;
  wallpaper = config.falak.system.hosts.${hostName}.wallpaper or default.wallpaper;
  themeFiles = config.programs.matugen.theme.files;
in
{
  falak.home.configFile."matugen/config.toml".text = ''
    [config]

    # [config.wallpaper]
    # command = "swww"
    # arguments = ["img", "--transition-type", "center"]
    # set = true

    [config.custom_colors]
    yellow = { color = "#FFD45A", blend = false }
    green = { color = "#237227", blend = false }
    blue = { color = "#53CBF3", blend = false }
    rust = { color = "#8a290f", blend = false }
    gold = { color = "#6c501c", blend = false }
    olive = { color = "#4c6000", blend = false }
    slate = { color = "#2f3f83", blend = false }
    indigo = { color = "#4a3a8a", blend = false }
    maroon = { color = "#731c52", blend = false }
    pink = { color = "#7b435c", blend = false }
    rust_d = { color = "#db7b5f", blend = false }
    gold_d = { color = "#c0965b", blend = false }
    olive_d = { color = "#9cbd6f", blend = false }
    slate_d = { color = "#76afbf", blend = false }
    indigo_d = { color = "#9099d9", blend = false }
    maroon_d = { color = "#cf7fa7", blend = false }
    pink_d = { color = "#d09dc0", blend = false }

    [templates]
    qutebrowser_theme = { input_path = "~/.config/matugen/templates/qutebrowser.py", output_path = "~/.config/qutebrowser/themes/matugen_theme.py", post_hook = "qutebrowser :config-source" }

    [templates.waybar]
    input_path = '${default.templateFolder}/colors.css'
    output_path = '~/.config/waybar/colors.css'
    # post_hook = 'pkill -SIGUSR2 waybar'

    [templates.fuzzel]
    input_path = '${default.templateFolder}/fuzzel.ini'
    output_path = '~/.config/fuzzel/colors_matugen.ini'

    [templates.gtk3]
    input_path = '${default.templateFolder}/gtkcolors.css'
    output_path = '~/.config/gtk-3.0/colors.css'
    post_hook = 'gsettings set org.gnome.desktop.interface gtk-theme ""; gsettings set org.gnome.desktop.interface color-scheme "";gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3; gsettings set org.gnome.desktop.interface color-scheme prefer-{{mode}}'

    [templates.gtk4]
    input_path = '${default.templateFolder}/gtkcolors.css'
    output_path = '~/.config/gtk-4.0/colors.css'

    [templates.qt5ct]
    input_path = '${default.templateFolder}/qtcolors.conf'
    output_path = '~/.config/qt5ct/colors/matugen.conf'

    [templates.qt6ct]
    input_path = '${default.templateFolder}/qtcolors.conf'
    output_path = '~/.config/qt6ct/colors/matugen.conf'

    [templates.qt5_qss]
    input_path = '${default.templateFolder}/matugen.qss'
    output_path = '~/.config/qt5ct/qss/matugen.qss'

    [templates.qt6_qss]
    input_path = '${default.templateFolder}/matugen.qss'
    output_path = '~/.config/qt6ct/qss/matugen.qss'

    [templates.hyprland]
    input_path = '${default.templateFolder}/hyprland.conf'
    output_path = '~/.config/hypr/themes/colors.conf'
    post_hook = 'hyprctl reload'

    [templates.kvantum]
    input_path = './templates/kvantum-colors.kvconfig'
    output_path = '~/.config/Kvantum/matugen/matugen.kvconfig'

    [templates.kvantum_svg]
    input_path = './templates/kvantum-colors.svg'
    output_path = '~/.config/Kvantum/matugen/matugen.svg'
    post_hook = 'kvantummanager --set matugen'

    [templates.yazi]
    input_path = './templates/yazi-theme.toml'
    output_path = '~/.config/yazi/theme.toml'

    [templates.rofi]
    input_path = '${default.templateFolder}/matugen-rofi.rasi'
    output_path = '~/.config/rofi/matugen-rofi.rasi'

    [templates.sioyek]
    input_path = "${default.templateFolder}/sioyek.config"
    output_path = "~/.config/sioyek/colors.config"

    [templates.btop]
    input_path = '${default.templateFolder}/btop.theme'
    output_path = '~/.config/btop/themes/matugen.theme'

    [templates.Obsidian]
    input_path = '${default.templateFolder}/obsidian-theme.css'
    output_path = '~/My-Vault/.obsidian/snippets/matugen-theme.css'

    [templates.emacs]
    input_path = '${default.templateFolder}/doom-theme.el'
    input_path_modes = { dark = "${default.templateFolder}/doom-theme.el", light = "${default.templateFolder}/doom-theme-light.el" }
    output_path = '~/.config/doom/custom/doom-matugen-theme.el'
    post_hook = 'emacsclient --eval "(doom/reload)"'

    [templates.snappy]
    input_path = '${default.templateFolder}/snappy.ini'
    output_path = '~/.config/snappy-switcher/themes/matugen.ini'
    post_hook = 'snappy-switcher --daemon &'

    [templates.walker]
    input_path = '${default.templateFolder}/walker.css'
    output_path = '~/.config/walker/themes/matugen/colors.css'


    [templates.ghostty]
    input_path = '${default.templateFolder}/ghostty'
    output_path = '~/.config/ghostty/themes/Matugen'
    post_hook = '~/.config/matugen/hook.sh'

    [templates.starship]
    input_path = '${default.templateFolder}/starship-colors.toml'
    output_path = '~/.config/starship.toml'

    [templates.tmux]
    input_path = '${default.templateFolder}/tmux.conf'
    output_path = '~/.config/tmux/generated.conf'
    post_hook = 'tmux source-file ~/.config/tmux/generated.conf'

    [templates.fzf]
    input_path = '${default.templateFolder}/fzf.sh'
    output_path = '~/.config/fzf_matugen.sh'


  '';

  system.activationScripts.run-matugen-once = ''
    set -e

    if [ ! -f /home/${default.username}/.local/share/matugen-ran-once ]; then
      su -u ${default.username} ${pkgs.matugen}/bin/matugen image ${wallpaper}

      touch /home/${default.username}/.local/share/matugen-ran-once
    fi
  '';

  programs.matugen = {
    enable = true;
    variant = config.falak.system.hosts.${hostName}.variant or "dark";
    jsonFormat = "hex";
    type = config.falak.system.hosts.${hostName}.type or "scheme-tonal-spot";

    inherit wallpaper;

    templates = matugenTemplates;
  };
}
