local lualine = require("lualine")

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local filetype = {
  "filetype",
  icons_enabled = false,
}

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = " ", warn = " " },
  -- symbols = { error = "E ", warn = "W " },
  colored = true,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  -- symbols = { added = "", modified = "", removed = "" }, -- changes diff symbols
  cond = hide_in_width,
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'codedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { "dashboard", "NvimTree", "Outline" }, -- "alpha"
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { 'filename' },
    lualine_x = { diff, diagnostics, filetype },
    lualine_y = { },
    lualine_z = { }
  },
  inactive_sections = {
    lualine_a = { },
    lualine_b = { },
    lualine_c = { 'filename' },
    lualine_x = { },
    -- lualine_x = { diff, diagnostics, 'encoding', filetype },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
