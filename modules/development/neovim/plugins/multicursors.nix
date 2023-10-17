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
              key = "<leader>m";
              action = "${cmd}MCstart${cr}";
              options.desc = "Multicursor";
            }
          ];
        visual =
          let
            mode = "n";
          in
          [
            {
              inherit mode;
              key = "<leader>m";
              action = "${cmd}MCstart${cr}";
              options.desc = "Multicursor";
            }
          ];
      in
      config.nixvim.helpers.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal ++ visual);
    plugins = {
      multicursors.enable = true;
    };
  };
}
