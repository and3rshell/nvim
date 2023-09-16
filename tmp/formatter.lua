-- local M = {
--     filetype = {
--         php = {
--             require("formatter.filetypes.php").phpcbf
--         },
--         ["*"] = {
--             require("formatter.filetypes.any").remove_trailing_whitespace
--         }
--     }
-- }

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     command = "FormatWriteLock"
-- })

-- vim.keymap.set("n", "<leader>F", ":Format<cr>")
-- vim.keymap.set("n", "<leader><leader>F", ":FormatWrite<cr>")

-- return M

-- Utilities for creating configurations
local util = require("formatter.util")


local phpformatter = {
    -- exe = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/phpcbf",
    exe = "phpcbf",
    tempfile_dir = "/tmp/",
    args = { "--standard=PSR12" },
    stdin = false,
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        -- lua = {
        --     -- "formatter.filetypes.lua" defines default configurations for the
        --     -- "lua" filetype
        --     require("formatter.filetypes.lua").stylua,

        --     -- You can also define your own configuration
        --     function()
        --         -- Full specification of configurations is down below and in Vim help
        --         -- files
        --         return {
        --             exe = "stylua",
        --             args = {
        --                 "--search-parent-directories",
        --                 "--stdin-filepath",
        --                 util.escape_path(util.get_current_buffer_file_path()),
        --                 "--",
        --                 "-",
        --             },
        --             stdin = true,
        --         }
        --     end,
        -- },

        -- javascript = { eslint_fmt, prettier },
        -- css = prettier,
        -- scss = prettier,
        -- json = prettier,
        -- html = prettier,

        php = {
            function()
                table.insert(phpformatter.args, util.escape_path(util.get_current_buffer_file_path()))
                return phpformatter
            end,
        },

        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    },
})

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	group = vim.api.nvim_create_augroup("Format", { clear = true }),
-- 	pattern = "*",
-- 	command = "FormatWrite",
-- })

vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost" }, {
	group = vim.api.nvim_create_augroup("Format", { clear = true }),
	pattern = "*",
	command = "Format",
})
