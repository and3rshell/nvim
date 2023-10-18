require("nvim-treesitter.configs").setup {
    -- ensure_installed = "all",
    ensure_installed = {
        "php",
        "phpdoc",
        "vue",
        "bash",
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
        "luadoc",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "diff",
        "rust",
        "javascript",
        "typescript",
        "python",
        "regex",
        "sql",
        "css",
        "graphql"
    },
    ignore_install = {}, -- List of parsers to ignore installing

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true, -- false will disable the whole extension

        disable = { "html" },
        -- disable = function(lang, buf)
        --     local max_filesize = 100 * 1024 -- 100 KB
        --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        --     if ok and stats and stats.size > max_filesize then
        --         return true
        --     end
        -- end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    autopairs = {
        enable = true,
    },

    indent = {
        enable = true,
        disable = { }
    },

    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        disable = {},  -- optional, list of language that will be disabled
        -- disable = { "javascript" }, -- optional, list of language that will be disabled
        -- options
    },
}

require 'treesitter-context'.setup {
    enable = false,           -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
}
