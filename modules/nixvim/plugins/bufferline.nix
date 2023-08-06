{ ... }:

{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    closeCommand = "confirm bdelete %d";
    showCloseIcon = false;
    alwaysShowBufferline = false;
  };
}
