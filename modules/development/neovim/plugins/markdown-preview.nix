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
          "<leader>p" = {
            action = "${cmd}MarkdownPreview${cr}";
            desc = "Markdown preview";
          };
        };
      };
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
