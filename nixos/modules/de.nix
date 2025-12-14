{ config, pkgs, inputs, ... }:

{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };
  
    environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        # System Packages
        git
        wget
        brightnessctl
        playerctl
        wl-clipboard
        tailscale
        fanctl

        # DE
        hyprland
        hyprlock
        hypridle
        hyprpicker
        hyprpaper
        xdg-desktop-portal-hyprland
        kitty # required for hyprland
        hyprpolkitagent
        inputs.quickshell.packages.${pkgs.system}.default # shell
        rofi # program launcher
        dunst # notifcation manager
        libnotify
        matugen
        

        # audio
        pipewire
        wireplumber

        # global programs..
        vscode
        nautilus
    ];
}