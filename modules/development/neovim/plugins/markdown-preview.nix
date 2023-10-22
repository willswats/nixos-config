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
              key = "<leader>p";
              action = "${cmd}MarkdownPreview${cr}";
              options.desc = "Markdown preview";
            }
          ];
      in
      config.nixvim.helpers.keymaps.mkKeymaps
        {
          options.silent = true;
        }
        (normal);

    plugins = {
      markdown-preview = {
        enable = true;
        previewOptions = {
          disable_sync_scroll = true;
        };
      };
    };
  };
}
