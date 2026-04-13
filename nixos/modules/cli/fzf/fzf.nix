# Fzf is a general-purpose command-line fuzzy finder.
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
  cfg = config.falak.cli.fzf;
in
{

  options.falak.cli.fzf = {
    enable = mkBoolOpt false "Whether to enable fzf as an alias for ls.";
  };

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
      # colors = lib.mkForce {
      #   "fg+" = accent;
      #   "bg+" = "-1";
      #   "fg" = foreground;
      #   "bg" = "-1";
      #   "prompt" = muted;
      #   "pointer" = accent;
      # };
      defaultOptions = [
        "--margin=1"
        "--layout=reverse"
        "--border=none"
        "--info='hidden'"
        "--header=''"
        "--prompt='/ '"
        "-i"
        "--no-bold"
        "--bind='enter:execute(nvim {})'"
        "--preview='bat --style=numbers --color=always --line-range :500 {}'"
        "--preview-window=right:60%:wrap"
      ];
    };
  };
}
