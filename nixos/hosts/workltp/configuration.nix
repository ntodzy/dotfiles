{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../base.nix
      ../../modules/de.nix
      ../../modules/sec-fingerprint.nix

      # Users
      # Don't forget to set a password with ‘passwd’.
      ../../users/todzy.nix
    ];

  networking = {
    hostName = "todzy-ltp";
    domain = "cs.wisc.edu";
  };

  # Enable networking
  networking.networkmanager.enable = true;
  programs.ssh.startAgent = true;

  
  users.users.todzy = {
  isNormalUser = true;
    description = "Nathan Todzy";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ neovim firefox spotify gcc discord obsidian ];
  };

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "todzy" ];
  };

  # Monitors Hyprland


  
  system.stateVersion = "25.05"; # Did you read the comment?
}
