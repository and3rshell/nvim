require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	ignore_install = { }, -- List of parsers to ignore installing
	auto_install = true,

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "css", "help" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},

	autopairs = {
		enable = true,
	},

	indent = {
		enable = true,
		disable = { "css", }
	},

	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
		disable = { "" }, -- optional, list of language that will be disabled
		-- options
	},
}
