# configuration.nix for ffm host

{ config, pkgs, ... }:

{
  networking.hostName = "ffm-nixos"; # Define your hostname.

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  users.users.filofem = {
    isNormalUser = true;
    description = "FILOfem";
    extraGroups = [ "networkmanager" ];
  };
}
