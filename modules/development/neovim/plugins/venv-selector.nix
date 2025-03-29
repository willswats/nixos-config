{ config, pkgs, ... }:

let
  venv-selctor = pkgs.vimUtils.buildVimPlugin {
    name = "venv-selctor";
    src = pkgs.fetchFromGitHub {
      owner = "linux-cultist";
      repo = "venv-selector.nvim";
      rev = "c677caa1030808a9f90092e522de7cc20c1390dd"; # https://github.com/linux-cultist/venv-selector.nvim/commit/c677caa1030808a9f90092e522de7cc20c1390dd
      hash = "sha256-ogd4T+mIbb86qFUbDczzDra8yWm/bwKmYCRGYCJz6fM=";
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
