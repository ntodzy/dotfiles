{ config, pkgs, inputs, ... }:

{
    systemd.services.fprintd = {
      description = "Fingerprint authentication service";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "simple";
      };
    };

    services.fprintd.enable = true;
    services.fprintd.tod.enable = true;
    services.fprintd.tod.driver = pkgs.libfprint-2-tod1-goodix;
}