local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

local status_ok_toggleterm_terminal, toggleterm_terminal = pcall(require, "toggleterm.terminal")
if not status_ok_toggleterm_terminal then
  return
end

toggleterm.setup {
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  -- size can be a number or function which is passed the current terminal
  size = 10,
  open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = false,
  -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
  direction = "float",
  close_on_exit = true, -- close the terminal window when the process exits
  shell = "fish", -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = "curved",
    -- width = <value>,
    -- height = <value>,
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

function LAZYGIT_TOGGLE()
  local Terminal = toggleterm_terminal.Terminal
  local lazygit = Terminal:new({
    cmd = "lazygit",
    count = 100
  })
  lazygit:toggle()
end
