require'nvim-treesitter.configs'.setup {
	-- ensure_installed = "all",
	ensure_installed = {
        "php",
        "phpdoc",
        "vue",
        "bash",
        -- "html",
        "c",
        "cpp",
        "cmake",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "http",
        "jq",
        "json",
        "json5",
        "make",
        "lua",
        "vim",
        "diff",
        "rust",
        "javascript"
    } ,
	ignore_install = { "sql", "markdown", "css", "help", "python"  }, -- List of parsers to ignore installing
	auto_install = false,

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "sql", "markdown", "css", "help" }, -- list of language that will be disabled
		-- additional_vim_regex_highlighting = false,
		additional_vim_regex_highlighting = true,
	},

	autopairs = {
		enable = true,
	},

	indent = {
		enable = true,
		disable = { "css", "html" }
	},

	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
		disable = { "javascript" }, -- optional, list of language that will be disabled
		-- options
	},
}

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
}
