{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.programs.river;
in {
  options.programs.river = {
    enable = mkEnableOption "enable river";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.river ];
    services.xserver.displayManager.sessionPackages = [ pkgs.river ];
  };
}
