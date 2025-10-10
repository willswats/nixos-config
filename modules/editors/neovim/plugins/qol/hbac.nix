{ pkgs, ... }:

let
  hbac = pkgs.vimUtils.buildVimPlugin {
    name = "hbac";
    dependencies = [
      pkgs.vimPlugins.telescope-nvim
      pkgs.vimPlugins.plenary-nvim
    ];
    src = pkgs.fetchFromGitHub {
      owner = "axkirillov";
      repo = "hbac.nvim";
      rev = "v3.0.0";
      hash = "sha256-kIStYRQyoxe2e9pGE0Ie4xV04sGKEBbaZXvS7CT5DQ0=";
    };
  };
in
{
  programs.nixvim = {
    extraPlugins = [ hbac ];
    extraConfigLua = ''
      require("hbac").setup({
        autoclose = true,
        threshold = 1,
      })
    '';
  };
}
