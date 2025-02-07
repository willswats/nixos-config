{ pkgs, host, globals, ... }:

let
  user = globals.user;
in
{
  imports = [
    # ../modules/desktop/sway
    ../modules/desktop/hyprland
    ../modules/system/plymouth
    ../modules/system/pipewire
    ../modules/system/printing
    ../modules/system/bluetooth
    ../modules/development/dotnet
    ../modules/development/podman
    ../modules/theme/gtk
    ../modules/theme/qt
    ../modules/theme/cursor
    ../modules/theme/catppuccin
    ../modules/utilities/nh
    ../modules/utilities/gnome-keyring
    ../modules/utilities/nautilus
    ../modules/utilities/mullvad-vpn
    ../modules/utilities/virt-manager
    ../modules/utilities/wireshark
    ../modules/utilities/gpu-screen-recorder
    ../modules/utilities/ollama
  ];

  # Temp fix for hibernate https://github.com/systemd/systemd/issues/34304#issuecomment-2550498883
  # TODO: remove this when on the version of systemd with this commit https://github.com/systemd/systemd/pull/35497
  systemd.package = pkgs.systemd.overrideAttrs (old: {
    patches = old.patches ++ [
      (pkgs.fetchurl {
        url = "https://github.com/wrvsrx/systemd/compare/tag_fix-hibernate-resume%5E...tag_fix-hibernate-resume.patch";
        hash = "sha256-Z784xysVUOYXCoTYJDRb3ppGiR8CgwY5CNV8jJSLOXU=";
      })
    ];
  });

  # 6.10 is needed for Vocaster One drivers
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Daemon for updating firmware
  services.fwupd.enable = true;

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

  console = {
    keyMap = "uk";
  };
  catppuccin.tty.enable = true;

  # Networking
  networking = {
    hostName = host.hostName;
    networkmanager.enable = true;
  };

  # Enable polkit
  security.polkit.enable = true;

  users.users.${user} = {
    isNormalUser = true;
    description = user;
    extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  environment = {
    variables = {
      TERMINAL = "kitty";
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1"; # Wayland for Chromium and Electron
    };
    # Add shells to /etc/shells
    shells = with pkgs; [ fish ];
  };

  # Use the first portal implementation found in lexicographical order:
  # https://github.com/flatpak/xdg-desktop-portal/blob/1.18.1/doc/portals.conf.rst.in
  xdg.portal.config.common.default = "*";

  nix = {
    # Setup flakes
    package = pkgs.nixVersions.stable;
    extraOptions = "experimental-features = nix-command flakes";

    settings = {
      # Setup automatic garbage collection
      auto-optimise-store = true;
    };

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

  system = { stateVersion = "23.05"; };
}
