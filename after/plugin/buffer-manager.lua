local opts = { noremap = true }

require("buffer_manager").setup({
    select_menu_item_commands = {
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
    short_file_names = true,
    short_term_names = true,
    loop_nav = false,
})

local bmui = require("buffer_manager.ui")
local keys = '1234567890'

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
vim.keymap.set({ 't', 'n' }, 'M', bmui.toggle_quick_menu, opts)

-- Open menu and search
vim.keymap.set({ 't', 'n' }, '<leader>M', function()
    bmui.toggle_quick_menu()
    -- wait for the menu to open
    vim.defer_fn(function()
        vim.fn.feedkeys('/')
    end, 50)
end, opts)

-- Next/Prev
vim.keymap.set('n', '<leader>,', bmui.nav_prev, opts)
vim.keymap.set('n', '<leader>.', bmui.nav_next, opts)
