{ config, pkgs, ... }:

let
  venv-selctor = pkgs.vimUtils.buildVimPlugin {
    name = "venv-selctor";
    src = pkgs.fetchFromGitHub {
      owner = "linux-cultist";
      repo = "venv-selector.nvim";
      rev = "f202a8375919dd643d9d186fbc8dbe14dcb2e5a9"; # https://github.com/linux-cultist/venv-selector.nvim/commit/f202a8375919dd643d9d186fbc8dbe14dcb2e5a9
      hash = "sha256-2+Xi7zUv2VcRjSs7lWvJP73nJ48vWBNw7KMIKpMMwcY=";
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
