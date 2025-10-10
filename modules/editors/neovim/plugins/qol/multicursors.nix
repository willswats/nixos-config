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
              key = "<leader>ms";
              action = "${cmd}MCstart${cr}";
              options.desc = "Start";
            }
            {
              inherit mode;
              key = "<leader>mv";
              action = "${cmd}MCvisual${cr}";
              options.desc = "Visual";
            }
            {
              inherit mode;
              key = "<leader>mc";
              action = "${cmd}MCclear${cr}";
              options.desc = "Clear";
            }
            {
              inherit mode;
              key = "<leader>mp";
              action = "${cmd}MCpattern${cr}";
              options.desc = "Pattern";
            }
            {
              inherit mode;
              key = "<leader>mV";
              action = "${cmd}MCvisualPattern${cr}";
              options.desc = "Visual pattern";
            }
            {
              inherit mode;
              key = "<leader>mu";
              action = "${cmd}MCunderCursor${cr}";
              options.desc = "Under cursor";
            }
          ];
      in
      config.lib.nixvim.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);

    plugins.multicursors.enable = true;
  };
}
