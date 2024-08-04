local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("harpoon").setup({
    menu = {
        width = 80,
        height = 15
    }
})

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "m", ui.toggle_quick_menu)
-- vim.keymap.set("n", "m", "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>")

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader>6", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader>7", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader>8", function() ui.nav_file(8) end)
vim.keymap.set("n", "<leader>9", function() ui.nav_file(9) end)
vim.keymap.set("n", "<leader>0", function() ui.nav_file(10) end)

-- vim.keymap.set("n", "", function() ui.nav_file(11) end)

vim.keymap.set("n", 'M', function()
    ui.toggle_quick_menu()
    -- wait for the menu to open
    vim.defer_fn(function()
        vim.fn.feedkeys('/')
    end, 50)
end, { noremap = true })
