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
    ./noice.nix
    ./toggleterm.nix
    ./gitsigns.nix
    ./illuminate.nix
  ];

  programs.nixvim.plugins = {
    treesitter.enable = true;
    comment-nvim.enable = true;
    which-key.enable = true;
    nvim-autopairs.enable = true;
    ts-autotag.enable = true;
    indent-blankline.enable = true;
  };
}
