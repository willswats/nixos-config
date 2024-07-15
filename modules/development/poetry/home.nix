{ ... }:

{
  xdg.configFile."pypoetry/config.toml" = {
    text = ''
      [virtualenvs]
      in-project = true
    '';
  };
}
