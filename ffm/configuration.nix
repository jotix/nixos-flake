# configuration.nix for ffm host

{ config, pkgs, ... }:

{
  networking.hostName = "ffm-nixos"; # Define your hostname.

  users.users.filofem = {
    isNormalUser = true;
    description = "FILOfem";
    extraGroups = [ "networkmanager" ];
  };
}
