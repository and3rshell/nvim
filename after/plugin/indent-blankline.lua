vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
-- vim.opt.listchars:append "space:⋅"

require("ibl").setup {
    enabled = false,
    debounce = 1000,
    exclude = {
        filetypes = {
            'lspinfo',
            'packer',
            'checkhealth',
            'help',
            'man',
            'gitcommit',
            'TelescopePrompt',
            'TelescopeResults',
            '',
            'alpha',
            'fzf',
            "markdown",
            "json",
            "txt",
            "undotree",
            "git",
            "env"
        },
        buftypes = {
            'terminal',
            'nofile',
            'quickfix',
            'prompt'
        },
    },
    scope = {
        enabled = true,
        show_start = true,
        show_end = true
    },
    indent = {
        char = "",
        -- char = "⋅",
        -- char = "~",
        -- tab_char = { "a", "b", "c" },
        smart_indent_cap = true
    },
    whitespace = {
        remove_blankline_trail = true
    }
}
