{ config, pkgs, ... }:

{
  imports = [
    ../modules/pipewire
    ../modules/theme
    ../modules/i3
    ../modules/plymouth
    ../modules/pcmanfm
    ../modules/mullvad-vpn
  ];

  time.timeZone = "Europe/London";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  console.keyMap = "uk";

  services.xserver = {
    enable = true;
    layout = "gb";
    xkbVariant = "";

    libinput = {
      enable = true;

      mouse = {
        accelProfile = "flat";
      };

      touchpad = {
        accelProfile = "flat";
      };
    };
  };

  # Networking
  networking.networkmanager.enable = true;

  # Enable polkit
  security.polkit.enable = true;

  # Enable bluetooth 
  hardware.bluetooth.enable = true;

  users.users.will = {
    isNormalUser = true;
    description = "will";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
    };
    # Add shells to /etc/shells
    shells = with pkgs; [ fish ];
  };

  nix = {
    # Setup flakes
    package = pkgs.nixFlakes;
    extraOptions = "experimental-features = nix-command flakes";

    # Setup automatic garbage collection
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  nixpkgs.config = {
    # Allow unfree packages
    allowUnfree = true;
  };

  system = {
    stateVersion = "23.05";
  };
}
