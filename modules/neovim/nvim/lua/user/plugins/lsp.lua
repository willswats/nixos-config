local status_ok_mason, mason = pcall(require, "mason")
if not status_ok_mason then
  return
end

local status_ok_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_mason_lspconfig then
  return
end

local status_ok_lspconfig, lspconfig = pcall(require, "lspconfig")
if not status_ok_lspconfig then
  return
end

local status_ok_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok_cmp_nvim_lsp then
  return
end

local status_ok_icons, icons = pcall(require, "user.icons")
if not status_ok_icons then
  return
end

mason.setup({ PATH = "append" })
mason_lspconfig.setup({
  ensure_installed = {
    "marksman",
    "html",
    "cssls",
    "jsonls",
    "tsserver",
    "eslint",
    "lua_ls",
    "rust_analyzer",
    "nil_ls",
  },
})

local lsp_capabilities = cmp_nvim_lsp.default_capabilities()

local lsp_settings = {
  Lua = {
    diagnostics = {
      globals = { "vim" },
    },
  },
}

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
      settings = lsp_settings,
    })
  end,
})

local signs = {
  { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
  { name = "DiagnosticSignWarn",  text = icons.diagnostics.BoldWarning },
  { name = "DiagnosticSignHint",  text = icons.diagnostics.BoldHint },
  { name = "DiagnosticSignInfo",  text = icons.diagnostics.BoldInformation },
}

for _, sign in pairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end
