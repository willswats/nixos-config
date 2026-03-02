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
              key = "<leader>n";
              action = "${cmd}NoiceTelescope${cr}";
              options.desc = "Open nvim error picker";
            }
          ];
      in
      config.lib.nixvim.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);
    plugins.noice = {
      enable = true;
      settings.presets = {
        bottom_search = false;
        command_palette = true;
        long_message_to_split = false;
        inc_rename = true;
        lsp_doc_border = true;
      };
    };
  };
}
