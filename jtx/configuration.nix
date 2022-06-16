# configuration.nix for ffm host

{ config, pkgs, ... }:

{
  networking.hostName = "jtx-nixos"; # Define your hostname.
  
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
}
