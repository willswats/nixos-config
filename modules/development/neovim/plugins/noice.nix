{ ... }:

{
  programs.nixvim.plugins.noice = {
    enable = true;
    presets = {
      bottom_search = false;
      command_palette = true;
      long_message_to_split = false;
      inc_rename = false;
      lsp_doc_border = true;
    };
  };
}
