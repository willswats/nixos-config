{ pkgs, config, ... }:

{

  home.packages = with pkgs; [
    fd # Telescope dependency
    ripgrep # Telescope dependency
  ];

  programs.nixvim = {
    maps =
      let
        cr = "<CR>";
        cmd = "<CMD>";
      in
      config.nixvim.helpers.mkMaps { silent = true; } {
        normal = {
          "<leader>ff".action = "${cmd}Telescope find_files${cr}";
          "<leader>ft".action = "${cmd}Telescope live_grep${cr}";
          "<leader>fr".action = "${cmd}Telescope resume${cr}";
          "<leader>fg".action = "${cmd}Telescope git_files${cr}";
          "<leader>fb".action = "${cmd}Telescope buffers${cr}";
          "<leader>fd".action = "${cmd}Telescope diagnostics${cr}";
        };
      };
    plugins.telescope = {
      enable = true;
    };
  };
}
