{ config, pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      theme = "catppuccin-mocha";
      themePackages = [
        (pkgs.catppuccin-plymouth.override { variant = "mocha"; })
      ];
    };
  };

  networking = {
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
    gvfs.enable = true; # Fix wastebasket restore (GVfs is GNOME's userspace virtual filesystem)
    blueman.enable = true;
    mullvad-vpn.enable = true;
    geoclue2.enable = true;

    xserver = {
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

      desktopManager = {
        xterm.enable = false;
      };

      excludePackages = with pkgs; [ xterm ];

      displayManager = {
        lightdm = {
          enable = true;
          background = ../wallpapers/minimal-desert.png;
          greeters.gtk = {
            enable = true;
            theme = {
              name = "Catppuccin-Mocha-Standard-Blue-dark";
              package = pkgs.catppuccin-gtk.override {
                accents = [ "blue" ];
                size = "standard";
                variant = "mocha";
              };
            };
            iconTheme = {
              name = "Papirus-Dark";
              package = pkgs.catppuccin-papirus-folders.override {
                accent = "blue";
                flavor = "mocha";
              };
            };
            cursorTheme = {
              name = "Catppuccin-Mocha-Dark-Cursors";
              package = pkgs.catppuccin-cursors.mochaDark;
              size = 32; # 24 32 48 64
            };
          };
        };
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

  console.keyMap = "uk";

  users.users.will = {
    isNormalUser = true;
    description = "will";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    shell = pkgs.fish;
  };

  programs = {
    fish.enable = true;
    dconf.enable = true;
  };

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