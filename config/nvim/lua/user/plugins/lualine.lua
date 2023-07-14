local status_ok_lualine, lualine = pcall(require, "lualine")
if not status_ok_lualine then
  return
end

local status_ok_icons, icons = pcall(require, "user.icons")
if not status_ok_icons then
  return
end

local branch = {
  "branch",
  icon = icons.git.Branch
}

local diagnostics = {
  "diagnostics",
  symbols = {
    error = icons.diagnostics.Error .. " ",
    warn = icons.diagnostics.Warning .. " ",
    hint = icons.diagnostics.Hint .. " "
  },
}

local diff = {
  "diff",
  symbols = {
    added = icons.git.LineAdded .. " ",
    modified = icons.git.LineModified .. " ",
    removed = icons.git.LineRemoved .. " "
  },
}

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = icons.ui.LineMiddle, right = icons.ui.LineMiddle },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { branch, diff, diagnostics },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})
