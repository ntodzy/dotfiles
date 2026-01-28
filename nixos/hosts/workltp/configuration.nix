{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../base.nix

      # Niri and DMS
      ../../modules/niri.nix
      inputs.dms.nixosModules.dank-material-shell

      # Users
      # Don't forget to set a password with ‘passwd’.
      ../../users/todzy.nix
    ];

  networking = {
    hostName = "todzy-ltp";
    domain = "cs.wisc.edu"; 
  };

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openconnect
   ];	
  };

  #programs.ssh.startAgent = true;

  programs.dank-material-shell = {
    enable = true;
    enableSystemMonitoring = true;
    dgop.package = inputs.dgop.packages.${pkgs.system}.default;
  };

  fonts.packages = with pkgs; [
    material-design-icons
    material-symbols
    nerd-fonts.fira-code
    inter
  ];

  programs.seahorse.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    greetd.enableGnomeKeyring = true;
    greetd-password.enableGnomeKeyring = true;
    login.enableGnomeKeyring = true;
  };

  services.dbus.packages = [ pkgs.gnome-keyring pkgs.gcr ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "todzy" ];
  };

  environment.etc."rclone-mnt.conf".text = ''
    [stardust]
    type = sftp
    host = 100.72.253.9
    user = todzy
    key_file = ~/.ssh/id_ed25519
  '';

  environment.systemPackages = with pkgs; [
    # System Packages
    openconnect
    rclone

    # dms
    wl-clipboard
    accountsservice
  ];
  
  system.stateVersion = "25.11"; # Did you read the comment?
}
