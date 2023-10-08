{ config, ... }:

{
  programs.nixvim = {
    maps =
      let
        cr = "<CR>";
        cmd = "<CMD>";
      in
      config.nixvim.helpers.mkMaps { silent = true; } {
        normal = {
          "<leader>m" = {
            action = "${cmd}MCstart${cr}";
            desc = "Multicursor";
          };
        };
        visual = {
          "<leader>m" = {
            action = "${cmd}MCstart${cr}";
            desc = "Multicursor";
          };
        };
      };
    plugins = {
      multicursors.enable = true;
    };
  };
}
