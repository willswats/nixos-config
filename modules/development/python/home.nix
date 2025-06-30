{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3Full
    poetry
    # (poetry.override { python3 = python3Full; }) # override is required for tkinter - uncomment this when needed, it's not cached and can take a while
  ];

  xdg.configFile."pypoetry/config.toml" = {
    text = ''
      [virtualenvs]
      in-project = true
    '';
  };
}
