### share configuration

{ config, pkgs, ... }:

{
  # imports =
  #   [ # Include the results of the hardware scan.
  #     ./hardware-configuration.nix
  #   ];

  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Argentina/Buenos_Aires";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_AR.utf8";
    LC_IDENTIFICATION = "es_AR.utf8";
    LC_MEASUREMENT = "es_AR.utf8";
    LC_MONETARY = "es_AR.utf8";
    LC_NAME = "es_AR.utf8";
    LC_NUMERIC = "es_AR.utf8";
    LC_PAPER = "es_AR.utf8";
    LC_TELEPHONE = "es_AR.utf8";
    LC_TIME = "es_AR.utf8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "altgr-intl";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jotix = {
    isNormalUser = true;
    description = "jotix";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager.users.jotix = { pkgs, ... }: {
    # home.packages = [ pkgs.atool pkgs.httpie ];
    programs.bash = {
      enable = true;
      shellAliases = {
        ll = "exa -l";
        la = "exa -lha";
      };
    };
    programs.neovim = {
      enable = true;
      extraConfig = ''
        set nocompatible
        set nobackup
        set number
      '';
    };
    programs.git = {
      enable = true;
      userName = "jotix";
      userEmail = "jujodeve@gmail.com";
    };
    programs.bat.enable = true;
    programs.exa.enable = true;
    programs.powerline-go.enable = true;

    xdg.userDirs = {
      enable = true;
      documents = "/home/jotix/Sync/Documents";
      pictures = "/home/jotix/Sync/Pictures";
    };

    programs.password-store.enable = true;
    programs.password-store.settings = { PASSWORD_STORE_DIR = "/home/jotix/Sync/Vault/password-store"; };

    services.syncthing.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # pass
    wl-clipboard
    xclip
    wget
    neovim
    git
    vscode
    firefox
    gnome.gnome-tweaks
    ubuntu_font_family
    #google-fonts
    gnucash
    libreoffice
    gimp
    pavucontrol
  ];

  programs.neovim.defaultEditor = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryFlavor = "curses";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # services.syncthing = {
  #   enable = true;
  #   user = "jotix";
  #   dataDir = "/home/jotix";
  #   configDir = "/home/jotix/.config/syncthing";
  #   overrideFolders = false;
  #   overrideDevices = false;
  # };

  services.flatpak.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
