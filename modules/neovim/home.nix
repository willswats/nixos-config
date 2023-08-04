{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fd # Telescope dependency
    ripgrep # Telescope dependency
    gcc # rustup dependency
    rustup # Provides rust LSP
    nil # Nix LSP
    nixpkgs-fmt # Nix formatter
    lua-language-server # Lua language server and formatter
    nodePackages.typescript-language-server # TypeScript LSP
    nodePackages.prettier # Code formatter for many languages
    nodePackages.markdownlint-cli # Markdown linter
    nodePackages.eslint # JS, TS Linter
    marksman # Markdown lsp
    trash-cli # Required for nvim-tree trash
  ];
  #
  # programs.neovim = {
  #   enable = true;
  #   withNodeJs = true;
  #   withPython3 = true;
  #   withRuby = true;
  #   extraPython3Packages = pyPkgs: with pyPkgs;[
  #     pynvim
  #   ];
  # };
  #
  # xdg.configFile.nvim.source = ./nvim;
  programs.nixvim = {
    enable = true;
    options = {
      backup = false; # Creates a backup file
      swapfile = false; # Creates a swapfile
      clipboard = "unnamedplus"; # Allows neovim to access the system clipboard
      number = true; # Show numbered lines
      tabstop = 2; # Insert two spaces for a tab
      cursorline = true; # Highlight the current line
    };
    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha";
    };
    globals.mapleader = " ";
    maps = {
      normal = {
        # Better window navigation
        "<C-h>" = {
          action = "<C-w>h";
          silent = true;
        };
        "<C-j>" = {
          action = "<C-w>j";
          silent = true;
        };
        "<C-k>" = {
          action = "<C-w>k";
          silent = true;
        };
        "<C-l>" = {
          action = "<C-w>l>";
          silent = true;
        };
      };
    };
    autoCmd = [
      {
        event = [ "FileType" ];
        pattern =
          [ "qf" "help" "man" "lspinfo" "lsp-installer" "null-ls-info" ];
        callback = {
          __raw = ''
            function()
                vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
                vim.opt_local.buflisted = false
              end
          '';
        };
      }
      {
        # Set markdown and gitcommit opts
        event = [ "FileType" ];
        pattern = [ "markdown" "gitcommit" ];
        callback = {
          __raw = ''
            function()
                vim.opt_local.wrap = true
                vim.opt_local.linebreak = true
            end'';
        };
      }
      # Show highlight on yank
      {
        event = [ "TextYankPost" ];
        callback = {
          __raw = ''
            	  function()
                        vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
            	    end
          '';
        };
      }
      # Auto format on write
      {
        event = [ "BufWritePre" ];
        callback = {
          __raw = ''
            function()
                vim.lsp.buf.format({ async = false })
              end'';
        };
      }
    ];
    plugins = {
      telescope = { enable = true; };
      nvim-tree = { enable = true; };
      nvim-autopairs = { enable = true; };
      noice = { enable = true; };
      bufferline = { enable = true; };
      treesitter = { enable = true; };
      lualine = { enable = true; };
      toggleterm = { enable = true; };
      which-key = { enable = true; };
      gitsigns = { enable = true; };
      indent-blankline = { enable = true; };
      lsp = {
        enable = true;
        servers = { nil_ls.enable = true; };
      };
      null-ls = {
        enable = true;
        sources = {
          formatting = {
            prettier.enable = true;
            nixfmt.enable = true;
            markdownlint.enable = true;
          };
        };
      };
    };
  };
}
