{ ... }:
{
  programs.nixvim.plugins.tiny-inline-diagnostic = {
    enable = true;
    settings = {
      preset = "minimal";
    };
  };
}
