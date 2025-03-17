return {
    "ThePrimeagen/harpoon",
    enabled = false,
    config = function()
        local harpoon = require "harpoon"
        local mark = require "harpoon.mark"
        local ui = require "harpoon.ui"
        harpoon:setup()

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "m", ui.toggle_quick_menu)
        -- vim.keymap.set("n", "m", "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>")

        for _, idx in ipairs { 1, 2, 3, 4, 5 } do
            vim.keymap.set("n", string.format("<space>%d", idx), function()
                harpoon:list():select(idx)
            end)
        end

        vim.keymap.set("n", 'M', function()
            ui.toggle_quick_menu()
            -- wait for the menu to open
            vim.defer_fn(function()
                vim.fn.feedkeys('/')
            end, 50)
        end, { noremap = true })
    end,
}
