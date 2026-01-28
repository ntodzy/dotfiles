{ config, pkgs, ...}:

{
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;
  environment.variables.NIXOS_OZONE_WL = "1"; # fix electron apps
  environment.variables.GSK_RENDERER = "vulkan"; # fix gtk apps
  environment.variables.QT_QPA_PLATFORM = "wayland"; # fix qt apps


  environment.systemPackages = with pkgs; [
    mako
    libnotify
    fuzzel
    xwayland-satellite # helps X11
  ];

  nix.settings = {
    substituters = [ "https://niri.cachix.org" ];
    trusted-public-keys = [ "niri.cachix.org-1:Wv0Om07PsuJ90V2knjZPACTSg+bwqDcn46qa7T5eW+4=" ];
  };
}
