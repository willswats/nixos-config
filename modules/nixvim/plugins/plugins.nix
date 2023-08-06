{ ... }:

{
  imports = [
    ./lsp.nix
    ./nvim-cmp.nix
    ./null-ls.nix
    ./nvim-tree.nix
    ./bufferline.nix
    ./lualine.nix
    ./telescope.nix
    ./toggleterm.nix
  ];

  programs.nixvim.plugins = {
    noice.enable = true;
    treesitter.enable = true;
    lualine.enable = true;
    which-key.enable = true;
    gitsigns.enable = true;
    comment-nvim.enable = true;
    nvim-autopairs.enable = true;
    ts-autotag.enable = true;
    indent-blankline.enable = true;
    illuminate.enable = true;
  };
}
