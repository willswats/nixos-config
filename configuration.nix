{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/vda";
      useOSProber = true;
      # Enable grub cryptodisk
      enableCryptodisk = true;
    };

    initrd = {
      # Setup keyfile
      secrets = {
        "/crypto_keyfile.bin" = null;
      };
      luks.devices."luks-2cc37e3f-d240-45a0-8a2b-b511cc7a1f1e".keyFile = "/crypto_keyfile.bin";
    };
  };

  networking = {
    hostName = "will-desktop";
    networkmanager.enable = true;
    wireguard.enable = true;
  };

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

  services = {
    gvfs.enable = true;
    blueman.enable = true;
    mullvad-vpn.enable = true;
    geoclue2.enable = true;

    xserver = {
      enable = true;
      layout = "gb";
      xkbVariant = "";

      resolutions = [
        { x = 1920; y = 1080; }
      ];

      libinput = {
        enable = true;

        mouse = {
          accelProfile = "flat";
        };

        touchpad = {
          accelProfile = "flat";
        };
      };

      desktopManager = {
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "none+i3";
      };

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
        ];
      };
    };
  };

  security.polkit.enable = true;

  # Configure console keymap
  console.keyMap = "uk";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.will = {
    isNormalUser = true;
    description = "will";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    pulseaudio = true; # Explicit PulseAudio support in applications
  };

  environment.variables = {
    TERMINAL = "alacritty";
    EDITOR = "nvim";
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

  hardware = {
    # Enable PulseAudio
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
    # Enable bluetooth
    bluetooth.enable = true;
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

  fonts = {
    fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "Hack" ]; })
    ];
  };

  system = {
    stateVersion = "23.05";

    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
  };
}
