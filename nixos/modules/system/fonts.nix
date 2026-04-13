{
  config,
  pkgs,
  lib,
  hostName,
  ...
}:
with lib;
with lib.falak;
let
  cfg = config.falak.system.fonts;
in
{
  options.falak.system.fonts = {
    nerd-fonts = mkBoolOpt false "Whether to enable nerd-fonts.";
  };

  config = {
    fonts = {
      packages = with pkgs; [
        dejavu_fonts
        fira-code
        fira-code-symbols
        font-awesome
        hackgen-nf-font
        ibm-plex
        inter
        jetbrains-mono
        material-icons
        maple-mono.NF
        minecraftia
        nerd-fonts.im-writing
        nerd-fonts.blex-mono
        nerd-fonts.iosevka-term
        nerd-fonts.lilex
        nerd-fonts.ubuntu
        nerd-fonts.jetbrains-mono
        nerd-fonts.fira-mono
        noto-fonts
        noto-fonts-color-emoji
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-monochrome-emoji
        powerline-fonts
        roboto
        roboto-mono
        symbola
        terminus_font
      ];
    };
  };

}
