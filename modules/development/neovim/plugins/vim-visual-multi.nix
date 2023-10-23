{ pkgs, ... }:

{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      vim-visual-multi
    ];
    extraConfigVim = ''
      let g:VM_mouse_mappings = 1
    '';
  };
}
