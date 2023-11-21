{ config, pkgs, ... }:

let
  venv-selctor = pkgs.vimUtils.buildVimPlugin {
    name = "venv-selctor";
    src = pkgs.fetchFromGitHub {
      owner = "linux-cultist";
      repo = "venv-selector.nvim";
      rev = "c259dacb20a00fb84ec6006e9a24b4085b27120a";
      hash = "sha256-52DojadTx7iBp8x5VFhqOIJP5B/DaqT+K55b70v3dr0=";
    };
  };
in
{
  home.packages = with pkgs; [ fd ];

  programs.nixvim = {
    extraPlugins = [ venv-selctor ];
    extraConfigLua = ''
      require("venv-selector").setup({
          auto_refresh = true,
          search_venv_managers = false,
          search_workspace = true,
          search =  true,
          parents = 0 -- Stop venv-select from searching two directories above (slow) 
        })
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
              key = "<leader>vs";
              action = "${cmd}VenvSelect${cr}";
              options.desc = "Select";
            }
            {
              inherit mode;
              key = "<leader>vc";
              action = "${cmd}VenvSelectCached${cr}";
              options.desc = "Cached";
            }
          ];
      in
      config.nixvim.helpers.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);
  };
}
