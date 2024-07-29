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
              key = "<leader>fs";
              action = "${cmd}Telescope session-lens${cr}";
              options.desc = "Sessions";
            }
          ];
      in
      config.lib.nixvim.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);
    plugins.auto-session.enable = true;
  };

  programs.nixvim.extraConfigLua = ''
    require("telescope").load_extension("session-lens")
  '';
}
