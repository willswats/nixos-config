local status_ok_bufferline, bufferline = pcall(require, "bufferline")
if not status_ok_bufferline then
  return
end

local status_ok_icons, icons = pcall(require, "user.icons")
if not status_ok_icons then
  return
end

local function diagnostics_indicator(count, level)
  local icon = ""
  if level:match("error") then
    icon = icons.diagnostics.Error
  elseif level:match("warning") then
    icon = icons.diagnostics.Warning
  elseif level:match("hint") then
    icon = icons.diagnostics.Hint
  end
  return " " .. icon .. " " .. count
end

bufferline.setup({
  options = {
    mode = "buffers",                           -- set to "tabs" to only show tabpages instead
    numbers = "none",                           -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = "confirm bdelete %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "confirm bdelete %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",           -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,                 -- can be a string | function, see "Mouse actions"
    indicator = { style = "icon", icon = icons.ui.BoldLineLeft },
    buffer_close_icon = icons.ui.Close,
    modified_icon = icons.ui.Circle,
    close_icon = icons.ui.BoldClose,
    left_trunc_marker = icons.ui.ArrowCircleLeft,
    right_trunc_marker = icons.ui.ArrowCircleRight,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true,  -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = diagnostics_indicator,
    offsets = { { filetype = "NvimTree" } },
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
    persist_buffer_sort = true,   -- whether or not custom sorted buffers should persist
    separator_style = "thin",     -- | "thick" | "thin" | { 'any', 'any' },
    enforce_regular_tabs = false,
    always_show_bufferline = false,
    hover = {
      enabled = false,
      delay = 200,
      reveal = { 'close' }
    },
    sort_by = "id",
  },
})
