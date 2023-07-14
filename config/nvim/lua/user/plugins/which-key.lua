local status_ok_which_key, which_key = pcall(require, "which-key")
if not status_ok_which_key then
  return
end

local status_ok_icons, icons = pcall(require, "user.icons")
if not status_ok_icons then
  return
end

local setup = {
  plugins = {
    marks = true,     -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,
      suggestions = 20,
    }, -- use which-key for spelling hints
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true,    -- adds help for operators like d, y, ...
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<CR>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = icons.ui.DoubleChevronRight, -- symbol used in the command line area that shows your active key combo
    separator = icons.ui.BoldArrowRight,      -- symbol used between a key and it's label
    group = icons.ui.Plus,                    -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  window = {
    border = "single",        -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 3,                                                                -- spacing between columns
    align = "left",                                                             -- align columns left, center or right
  },
  ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  show_keys = true,                                                             -- show the currently pressed key and its label as a message in the command line
  triggers = "auto",                                                            -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
  -- disable the WhichKey popup for certain buf types and file types.
  -- Disabled by deafult for Telescope
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

-- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
-- see https://neovim.io/doc/user/map.html#:map-cmd
local mappings = {
  ["w"] = { "<cmd>w!<CR>", "Write format" },
  ["W"] = { "<cmd>noautocmd w<CR>", "Write" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No highlight" },
  ["q"] = { "<cmd>confirm q<CR>", "Quit" },
  ["p"] = { "<cmd>Lazy<CR>", "Plugins" },
  ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
  b = {
    name = "Buffers",
    d = { "<cmd>confirm bd<CR>", "Delete" },
    h = { "<cmd>BufferLineCloseLeft<CR>", "Delete left" },
    l = { "<cmd>BufferLineCloseRight<CR>", "Delete right" },
  },
  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<CR>", "Files" },
    o = { "<cmd>Telescope oldfiles<CR>", "Old files" },
    t = { "<cmd>Telescope live_grep<CR>", "Text" },
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
    r = { "<cmd>Telescope resume<CR>", "Resume" },
    d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
    c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<CR>", "Colorscheme" },
    g = {
      name = "Git",
      f = { "<cmd>Telescope git_files<CR>", "Files" },
      s = { "<cmd>Telescope git_status<CR>", "Status" },
      S = { "<cmd>Telescope git_stash<CR>", "Stash" },
      b = { "<cmd>Telescope git_branches<CR>", "Branches" },
      c = { "<cmd>Telescope git_commits<CR>", "Commits" },
      C = { "<cmd>Telescope git_bcommits<CR>", "Buffer commits" },
    }
  },
  t = {
    name = "Terminal",
    ["1"] = { "<cmd>ToggleTerm 1<CR>", "Toggle 1" },
    ["2"] = { "<cmd>ToggleTerm 2<CR>", "Toggle 2" },
    ["3"] = { "<cmd>ToggleTerm 3<CR>", "Toggle 3" },
    ["4"] = { "<cmd>ToggleTerm 4<CR>", "Toggle 4" },
    ["5"] = { "<cmd>ToggleTerm 5<CR>", "Toggle 5" },
    ["6"] = { "<cmd>ToggleTerm 6<CR>", "Toggle 6" },
    ["7"] = { "<cmd>ToggleTerm 7<CR>", "Toggle 7" },
    ["8"] = { "<cmd>ToggleTerm 8<CR>", "Toggle 8" },
    ["9"] = { "<cmd>ToggleTerm 9<CR>", "Toggle 9" },
    g = { "<cmd>lua LAZYGIT_TOGGLE()<CR>", "Toggle lazygit" },
  },
  g = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<CR>", "Next hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<CR>", "Prev hunk" },
    b = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage hunk" },
    S = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo stage hunk" },
  },
  l = {
    name = "LSP",
    m = { "<cmd>Mason<CR>", "Mason" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    r = { "<cmd>LspRestart<CR>", "Restart" },
    s = { "<cmd>LspStart<CR>", "Start" },
    S = { "<cmd>LspStop<CR>", "Stop" },
    l = { "<cmd>LspLog<CR>", "Log" },
    d = {
      name = "Diagnostics",
      j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
      k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Prev diagnostic" },
      f = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Float" },
      l = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Loc" },
    },
    b = {
      name = "Buffer",
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Action" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
      R = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      H = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Help" },
    },
  },
  d = {
    name = "Debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<CR>", "Step back" },
    c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<CR>", "Run to cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<CR>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<CR>", "Get session" },
    i = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
    o = { "<cmd>lua require'dap'.step_over()<CR>", "Step over" },
    u = { "<cmd>lua require'dap'.step_out()<CR>", "Step out" },
    p = { "<cmd>lua require'dap'.pause()<CR>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle REPL" },
    q = { "<cmd>lua require'dap'.close()<CR>", "Quit" },
    U = { "<cmd>lua require'dapui'.toggle({reset = true})<CR>", "Toggle UI" },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
