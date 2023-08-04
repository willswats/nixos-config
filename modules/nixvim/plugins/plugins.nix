{ ... }:

{
  imports = [ ./lsp.nix ./null-ls.nix ./nvim-tree.nix ./telescope.nix ];

  programs.nixvim.plugins = {
    nvim-autopairs.enable = true;
    noice.enable = true;
    bufferline.enable = true;
    treesitter.enable = true;
    lualine.enable = true;
    toggleterm.enable = true;
    which-key.enable = true;
    gitsigns.enable = true;
    indent-blankline.enable = true;
  };
}
