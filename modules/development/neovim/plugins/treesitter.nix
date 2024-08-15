{ ... }:

{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings.auto_install = true;
    settings.highlight.enable = true;
  };
}
