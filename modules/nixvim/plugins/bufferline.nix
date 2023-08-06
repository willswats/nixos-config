{ ... }:

{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    closeCommand = "confirm bdelete %d";
    showBufferCloseIcons = false;
    alwaysShowBufferline = false;
  };
}
