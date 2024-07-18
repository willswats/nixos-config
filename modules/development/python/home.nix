{ pkgs, ... }:


{
  home.packages = with pkgs; [
    python3Full
    (poetry.override { python3 = python3Full; }) # override is required for tkinter
  ];

  xdg.configFile."pypoetry/config.toml" = {
    text = ''
      [virtualenvs]
      in-project = true
    '';
  };
}
