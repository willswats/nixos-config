{ ... }:

{
  imports = [
    ./lsp.nix
    ./null-ls.nix
    ./nvim-tree.nix
    ./telescope.nix
    ./toggleterm.nix
  ];

  programs.nixvim.plugins = {
    noice.enable = true;
    bufferline.enable = true;
    treesitter.enable = true;
    lualine.enable = true;
    which-key.enable = true;
    gitsigns.enable = true;
    comment-nvim.enable = true;
    nvim-autopairs.enable = true;
    ts-autotag.enable = true;
    indent-blankline.enable = true;
    illuminate.enable = true;
    nvim-cmp.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-nvim-lua.enable = true;
    cmp_luasnip.enable = true;
    luasnip.enable = true;
  };
}
