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
          "<S-l>".action = "${cmd}BufferLineCycleNext${cr}";
          "<S-h>".action = "${cmd}BufferLineCyclePrev${cr}";
          "<A-l>".action = "${cmd}BufferLineMoveNext${cr}";
          "<A-h>".action = "${cmd}BufferLineMovePrev${cr}";
          "<leader>bh".action = "${cmd}BufferLineCloseLeft${cr}";
          "<leader>bl".action = "${cmd}BufferLineCloseRight${cr}";
        };
      };
    plugins.bufferline = {
      enable = true;
      closeCommand = "confirm bdelete %d";
      rightMouseCommand = "confirm bdelete %d";
      showBufferCloseIcons = false;
      alwaysShowBufferline = false;
    };
  };
}
