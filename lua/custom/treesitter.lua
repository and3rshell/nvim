vim.cmd [[
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set nofoldenable " Disable folding at startup.
]]

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
        "css"
    },
    ignore_install = {}, -- List of parsers to ignore installing

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true, -- false will disable the whole extension

        disable = function(lang, buf)
            if lang == "html" then
                print("disabled")
                return true
            end

            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                vim.notify(
                    "File larger than 100KB treesitter disabled for performance",
                    vim.log.levels.WARN,
                    {title = "Treesitter"}
                )
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        -- additional_vim_regex_highlighting = false,
        additional_vim_regex_highlighting = { "php", "markdown" },
    },

    autopairs = {
        enable = false,
    },

    indent = {
        enable = false,
        -- disable = { "php", "lua", "html", "blade" }
    },

    matchup = {
        enable = false, -- mandatory, false will disable the whole extension
        disable = {},  -- optional, list of language that will be disabled
        -- disable = { "javascript" }, -- optional, list of language that will be disabled
        -- options
    },

    incremental_selection = {
        enable = false,
        keymaps = {
            init_selection = "<leader>ss", -- set to `false` to disable one of the mappings
            node_incremental = "<leader>si",
            scope_incremental = "<leader>sc",
            node_decremental = "<leader>sd",
        }
    }
}
