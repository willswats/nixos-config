-- Set q to close files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "qf",
    "help",
    "man",
    "lspinfo",
    "lsp-installer",
    "null-ls-info",
  },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = true })
    vim.opt_local.buflisted = false
  end,
})

-- Set markdown and gitcommit opts
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "gitcommit" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
  end,
})

-- Show highlight on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Auto format on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
