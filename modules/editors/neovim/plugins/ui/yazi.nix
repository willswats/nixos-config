{ config, ... }:

{
  programs.nixvim = {
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
              key = "<C-e>";
              action = "${cmd}Yazi${cr}";
              options.desc = "Explorer";
            }
          ];
      in
      config.lib.nixvim.keymaps.mkKeymaps {
        options.silent = true;
      } (normal);

    plugins.yazi = {
      enable = true;
      settings = {
        open_for_directories = true;
        floating_window_scaling_factor = 1;
        yazi_floating_window_border = "single";
      };
    };
  };
}
