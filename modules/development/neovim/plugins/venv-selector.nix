{ config, pkgs, ... }:

let
  venv-selctor = pkgs.vimUtils.buildVimPlugin {
    name = "venv-selctor";
    src = pkgs.fetchFromGitHub {
      owner = "linux-cultist";
      repo = "venv-selector.nvim";
      rev = "f212a424fb29949cb5e683928bdd4038bbe0062d"; # https://github.com/linux-cultist/venv-selector.nvim/commit/f212a424fb29949cb5e683928bdd4038bbe0062d
      hash = "sha256-L4L14yq5Ix3w5ty/CImkQXx/CBxwH7jsQhU+dWKndtQ=";
    };
  };
in
{
  home.packages = with pkgs; [ fd ];

  programs.nixvim = {
    extraPlugins = [ venv-selctor ];
    extraConfigLua = ''
      require("venv-selector").setup()
    '';
    keymaps =
      let
        cr = "<CR>";
        cmd = "<CMD>";

        normal =
          let
            mode = "n";
          in
          [
            {
              inherit mode;
              key = "<leader>v";
              action = "${cmd}VenvSelect${cr}";
              options.desc = "Venv";
            }
          ];
      in
      config.lib.nixvim.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);
  };
}
