local conform = require('conform')

-- vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.keymap.set("n", "<leader>F", ":Format<CR>")
vim.keymap.set("v", "<leader>F", ":Format<CR>")

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_fallback = true, range = range })
end, { range = true })

conform.setup({
    formatters_by_ft = {
        -- lua = { "stylua" }, -- it leaves weird space, use lsp for formatting
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        -- php = { "pretty-php", "phpcbf" },
        php = { "phpcbf" },
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" }, -- why it adds extra spaces? ex. it leaves this: { "plugin",     tag = "..." }
    },
    -- Set the log level. Use `:ConformInfo` to see the location of the log file.
    log_level = vim.log.levels.ERROR,
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
})

conform.formatters.phpcbf = {
    prepend_args = { "--standard=PSR12", "--tab-width=4" },
}

-- conform.formatters.pretty_php = {
--     prepend_args = { "--psr12", "--tabs=4" },
-- }

-- vim.api.nvim_create_user_command("Format", function(args)
--   local range = nil
--   if args.count ~= -1 then
--     local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
--     range = {
--       start = { args.line1, 0 },
--       ["end"] = { args.line2, end_line:len() },
--     }
--   end
--   require("conform").format({ async = true, lsp_fallback = true, range = range })
-- end, { range = true })
