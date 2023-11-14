local lualine = require("lualine")
-- local navic = require("nvim-navic")

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
	-- symbols = { error = " ", warn = " " },
	symbols = { error = "err:", warn = "warn:" },
	colored = true,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	symbols = { added = "new:", modified = "mod:", removed = "rm:" }, -- changes diff symbols
	cond = hide_in_width,
}

local progress = {
	"progress",
}

-- local nav = {
-- 	function()
-- 		return navic.get_location()
-- 	end,
-- 	cond = function()
-- 		return navic.is_available()
-- 	end,
-- }

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "16color",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" }, -- "alpha"
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		-- lualine_a = { 'mode' },
		-- lualine_b = { 'branch' },
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { diff, diagnostics, progress, filetype },
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		-- lualine_c = { 'filename' },
		lualine_c = {},
		lualine_x = {},
		-- lualine_x = { diff, diagnostics, 'encoding', filetype },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
