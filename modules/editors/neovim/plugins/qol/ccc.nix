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
              key = "C";
              action = "${cmd}CccPick${cr}";
              options.desc = "Color picker";
            }
          ];
      in
      config.lib.nixvim.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);
    plugins.ccc = {
      enable = true;
      settings = {
        highlighter = {
          auto_enable = true;
          excludes = [ "markdown" ];
        };
      };
    };
  };

}
