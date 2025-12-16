{ config, pkgs, inputs, ... }:

let
    sunshineCuda = pkgs.sunshine.override { cudaSupport = true; };
in
{
    services.sunshine = {
        package = sunshineCuda;
        enable = true;
        autoStart = true;
        capSysAdmin = true;
    };

    networking.firewall = {
        enable = true;
        interfaces.tailscale0.allowedTCPPorts = [ 47984 47989 47990 48010 ];
        interfaces.tailscale0.allowedUDPPortRanges = [
            { from = 47998; to = 48000; }
            { from = 8000; to = 8010; }
        ];
    };

    # Create virtual video device for Sunshine
    # be sure to set hyprctl monitors 
    # hyprctl output create headless sunshine
    # hyprctl keyword monitor sunshine, 1920x1080@60,0x0,1
}
