{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    poetry
  ];

  xdg.configFile."pypoetry/config.toml" = {
    text = ''
      [virtualenvs]
      in-project = true
    '';
  };
}
