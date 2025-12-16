{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../base.nix
      ../../modules/de.nix
      ../../modules/sunshine.nix
      ../../modules/sec-fingerprint.nix

      # Users
      # Don't forget to set a password with ‘passwd’.
      ../../users/todzy.nix
    ];


  # Enable networking
  networking.hostName = "todzydesktop"; # Define your hostname
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
    ];	
  };

  programs.ssh.startAgent = true;

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "todzy" ];
  };

  environment.systemPackages = with pkgs; [
    # System Packages
    openconnect
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;      # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  # see the note above
  hardware.nvidia.powerManagement.enable = true;
  
  # Monitors Hyprland
  system.stateVersion = "24.11"; # Did you read the comment?
}
