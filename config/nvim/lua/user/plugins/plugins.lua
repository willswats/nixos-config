local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status_ok_lazy, lazy = pcall(require, "lazy")
if not status_ok_lazy then
  return
end

local plugins = {
  -- General
  {
    "catppuccin/nvim",                   -- Colorscheme
    lazy = false,                        -- Load this during startup
    priority = 1000,                     -- Load this before all the other start plugins
  },
  { "nvim-lua/plenary.nvim" },           -- Dependency for many plugins
  { "nvim-treesitter/nvim-treesitter" }, -- Treesitter
  { "nvim-tree/nvim-web-devicons" },     -- Icons
  { "nvim-tree/nvim-tree.lua" },         -- Tree
  { "akinsho/bufferline.nvim" },         -- Bufferline
  { "nvim-lualine/lualine.nvim" },       -- Statusline
  { "nvim-telescope/telescope.nvim" },   -- Telescope
  { "akinsho/toggleterm.nvim" },         -- Toggleterm
  { "folke/which-key.nvim" },            -- Which key
  {
    "folke/noice.nvim",                  -- Replaces UI
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  { "lewis6991/gitsigns.nvim" },         -- Git signs
  { "jose-elias-alvarez/null-ls.nvim" }, -- Format & Lint
  { "numToStr/Comment.nvim" },           -- Comment
  {
    "windwp/nvim-ts-autotag",
    config = true
  },                                       -- Auto pair html
  {
    "windwp/nvim-autopairs",
    config = true
  },                                       -- Auto pair brackets
  {
    "lukas-reineke/indent-blankline.nvim", -- Show indent line
    lazy = true,                           -- Fix blue cursor
  },
  { "RRethy/vim-illuminate" },             -- Illuminate text
  { "jakewvincent/mkdnflow.nvim" },        -- Markdown editing
  { "mfussenegger/nvim-dap" },             -- DAP
  { "rcarriga/nvim-dap-ui" },              -- DAP UI

  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- Autocompletion
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-nvim-lua" },

  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },
}

lazy.setup(plugins)
