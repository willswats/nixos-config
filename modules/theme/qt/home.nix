{ pkgs, globals, ... }:


{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
  ];

  catppuccin.kvantum.enable = true;

  qt =
    let
      qtctSettings = {
        Appearance = {
          style = "kvantum-dark";
          icon_theme = "Papirus-Dark";
          standard_dialogs = "default";
        };
        Fonts = {
          fixed = "\"${globals.font.name},12\"";
          general = "\"${globals.font.name},12\"";
        };
      };
    in
    {
      enable = true;
      # Cant set this while using catppuccin.kvantum
      # https://github.com/catppuccin/nix/issues/275
      # Instead opted for setting environment variable in default.nix (same outcome)
      # platformTheme.name = "qtct";
      style.name = "kvantum";
      qt5ctSettings = qtctSettings;
      qt6ctSettings = qtctSettings;
    };
}
