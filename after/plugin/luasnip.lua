local luasnip = require('luasnip')
local types = require('luasnip.util.types')

vim.keymap.set("n", "<leader><leader>l", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

require('luasnip.loaders.from_vscode').lazy_load()

luasnip.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = false,

    -- This one is cool cause if you have dynamic snippets, it updates as you type!
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    region_check_events = 'InsertEnter',
    delete_check_events = 'InsertLeave'
}
