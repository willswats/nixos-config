local status_ok_null_ls, null_ls = pcall(require, "null-ls")
if not status_ok_null_ls then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier,
    formatting.nixpkgs_fmt,
    diagnostics.markdownlint.with({ extra_args = { "--disable", "MD013" } })
  },
})
