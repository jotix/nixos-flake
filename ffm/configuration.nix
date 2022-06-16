# configuration.nix for ffm host

{ config, pkgs, ... }:

{
  networking.hostName = "ffm-nixos"; # Define your hostname.
  
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  users.users.filofem = {
    isNormalUser = true;
    description = "FILOfem";
    extraGroups = [ "networkmanager" ];
  };
}
