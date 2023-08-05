{ ... }:

{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    autochdir = true;
    size = 10;
    openMapping = "<c-t>";
    hideNumbers = true;
    shadeTerminals = true;
    shadingFactor = 2;
    startInInsert = true;
    insertMappings = true;
    persistSize = false;
    direction = "float";
    closeOnExit = true;
    floatOpts = {
      border = "curved";
      winblend = 0;
    };
  };
}
