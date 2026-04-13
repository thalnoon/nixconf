{
  config,
  pkgs,
  lib,
  inputs,
  default,
  ...
}:
with lib;
with lib.falak;
let
  cfg = config.falak.cli.starship;
in
{
  options.falak.cli.starship = with types; {
    enable = mkBoolOpt false "Whether to enable starship.";
  };

  config = mkIf cfg.enable {
    # environment.systemPackages = with pkgs; [
    #   starship
    # ];
    falak.home.programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.bash.promptInit = ''eval "$(${pkgs.starship}/bin/starship init bash)"'';
  };
}
