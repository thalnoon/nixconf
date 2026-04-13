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
  cfg = config.falak.cli.bat;
in
{
  options.falak.cli.bat = {
    enable = mkBoolOpt false "Whether to enable bat as an alias for ls.";
  };

  config = mkIf cfg.enable {
    programs.bat = {
      enable = true;
      config = {
        pager = "less -FR";
        # other styles available and cane be combined
        #  style = "numbers,changes,headers,rule,grid";
        style = "full";
        # Bat has other thems as well
        # ansi,Catppuccin,base16,base16-256,GitHub,Nord,etc
        theme = lib.mkForce "base16";
      };
      extraPackages = with pkgs.bat-extras; [
        batman
        batpipe
        batgrep
      ];
    };

    home.sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
      MANROFFOPT = "-c";
    };
  };
}
