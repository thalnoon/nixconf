{
  config,
  pkgs,
  lib,
  inputs,
  default,
  ...
}:
with lib;
with lib.falak; let
  cfg = config.falak.cli.zsh;
in {
  options.falak.cli.zsh = {
    enable = mkBoolOpt false "Whether to enable zsh.";
  };
  config = mkIf (cfg.enable || config.falak.system.defaultShell == pkgs.zsh) {
    programs.zsh.enable = true;

    falak.home.extraOptions.programs.zsh = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        # switch-theme = "~/.config/hypr/scripts/switch-theme.sh";
        # switch-mode = "~/.config/hypr/scripts/switch-mode.sh";
        # edit-dots = "codium /home/${default.username}/dev/dotfiles/";
      };
      # enableCompletion = true;
      syntaxHighlighting = enabled;
      dotDir = "${config.xdg.configHome}/zsh";
      autosuggestion.enable = true;
      initContent = ''
        # Source a local zshrc so it's easier to edit
        [[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
      '';
    };
  };
}
