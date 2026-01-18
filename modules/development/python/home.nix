{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    # poetry TODO: uncomment when fixed
  ];

  xdg.configFile."pypoetry/config.toml" = {
    text = ''
      [virtualenvs]
      in-project = true
    '';
  };
}
