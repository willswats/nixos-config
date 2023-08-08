{ ... }:

{
  programs.nixvim.plugins.illuminate = {
    enable = true;
    filetypesDenylist = [ "NvimTree" "TelescopePrompt" "toggleterm" ];
  };
}
