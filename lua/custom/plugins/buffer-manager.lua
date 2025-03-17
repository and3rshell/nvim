return {
    "j-morano/buffer_manager.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        local opts = { noremap = true }

        require("buffer_manager").setup({
            -- line_keys = "1234567890",
            -- line_keys = "",
            select_menu_item_commands = {
                edit = {
                    key = "<CR>",
                    command = "edit"
                },
                v = {
                    key = "<C-v>",
                    command = "vsplit"
                },
                h = {
                    key = "<C-x>",
                    command = "split"
                }
            },
            focus_alternate_buffer = false,
            short_file_names = false,
            short_term_names = true,
            loop_nav = false,
            width = 80,
            height = 15
        })

        local bmui = require("buffer_manager.ui")
        -- local keys = '1234567890'
        local keys = '!@#$%^&*()'

        for i = 1, #keys do
            local key = keys:sub(i, i)
            vim.keymap.set(
                'n',
                string.format('<leader>%s', key),
                function() bmui.nav_file(i) end,
                opts
            )
        end

        -- Just the menu
        vim.keymap.set("n", '<leader>b', bmui.toggle_quick_menu, opts)

        -- Open menu and search
        vim.keymap.set("n", '<leader>B', function()
            bmui.toggle_quick_menu()
            -- wait for the menu to open
            vim.defer_fn(function()
                vim.fn.feedkeys('/')
            end, 50)
        end, opts)

        -- Next/Prev
        -- vim.keymap.set('n', '<leader>h', bmui.nav_prev, opts)
        -- vim.keymap.set('n', '<leader>l', bmui.nav_next, opts)
    end,
}
