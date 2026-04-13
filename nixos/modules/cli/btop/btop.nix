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
  cfg = config.falak.cli.btop;
in
{
  options.falak.cli.btop = {
    enable = mkBoolOpt false "Whether to enable btop as an alias for ls.";
  };
  config = mkIf cfg.enable {
    programs.btop = {
      enable = true;
      package = pkgs.btop.override {
        rocmSupport = true;
        cudaSupport = true;
      };
      settings = {
        vim_keys = true;
        rounded_corners = true;
        proc_tree = true;
        show_gpu_info = "on";
        show_uptime = true;
        show_coretemp = true;
        cpu_sensor = "auto";
        show_disks = true;
        only_physical = true;
        io_mode = true;
        io_graph_combined = false;
      };
    };
  };
}
