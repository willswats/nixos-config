{ config, pkgs, ... }:

{
  imports = [
    ../modules/theme
    ../modules/i3
    ../modules/plymouth
    ../modules/pcmanfm
    ../modules/virt-manager
    ../modules/mullvad-vpn
  ];

  networking.networkmanager.enable = true;

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

  security.polkit.enable = true;

  console.keyMap = "uk";

  users.users.will = {
    isNormalUser = true;
    description = "will";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  nixpkgs.config = {
    # Allow unfree packages
    allowUnfree = true;
    # Explicit PulseAudio support in applications
    pulseaudio = true;
  };

  environment = {
    variables = {
      TERMINAL = "alacritty";
      EDITOR = "nvim";
    };
    # Add shells to /etc/shells
    shells = with pkgs; [ fish ];
  };

  hardware = {
    # Enable PulseAudio
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull; # enable extra codecs
    };
    # Enable bluetooth
    bluetooth.enable = true;
  };

  # services.printing.enable = true;
  # sound.enable = true;
  # security.rtkit.enable = true;
  # services.pipewire = {
  #   enable = true;
  #   alsa.enable = true;
  #   alsa.support32Bit = true;
  #   pule.enable = true;

  # for jack apps
  # jack.enable = true

  # media-session.enable = true;
  # };

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

  system = {
    stateVersion = "23.05";
  };
}
