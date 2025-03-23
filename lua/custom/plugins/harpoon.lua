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

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        for _, idx in ipairs { 1, 2, 3, 4, 5 } do
            vim.keymap.set("n", string.format("<space>%d", idx), function()
                harpoon:list():select(idx)
            end)
        end
    end,
}
