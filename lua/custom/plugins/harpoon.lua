return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        menu = {
            width = 80,
            height = 15,
        },
        settings = {
            save_on_toggle = true,
        },
    },
    config = function()
        local harpoon = require "harpoon"
        local extensions = require("harpoon.extensions");
        harpoon:setup(opts)

        harpoon:extend(extensions.builtins.highlight_current_file())
        harpoon:extend(extensions.builtins.navigate_with_number());

        vim.keymap.set("n", "<space>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "m", function()
            harpoon.ui:toggle_quick_menu(harpoon:list(), {
                ui_max_width = 85,
                ui_width_ratio = 0.5,
                ui_min_width = 40,
                border = "rounded",
                title = "Harpoon",
                height_in_lines = 15
            })
        end)

        for _, idx in ipairs { 1, 2, 3, 4, 5 } do
            vim.keymap.set("n", string.format("<space>%d", idx), function()
                harpoon:list():select(idx)
            end)
        end
    end,
}
