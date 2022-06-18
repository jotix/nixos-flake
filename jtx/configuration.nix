# configuration.nix for ffm host

{ config, pkgs, ... }:

{
  networking.hostName = "jtx-nixos"; # Define your hostname.
  
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
}
