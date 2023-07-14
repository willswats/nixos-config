local status_ok_indent_blankline, indent_blankline = pcall(require, "indent_blankline")
if not status_ok_indent_blankline then
  return
end

local status_ok_icons, icons = pcall(require, "user.icons")
if not status_ok_icons then
  return
end

indent_blankline.setup({
  enabled = true,
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "lazy",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "text",
  },
  char = icons.ui.LineLeft,
  context_char = icons.ui.LineLeft,
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
})
