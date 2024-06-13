local zenmode = require("zen-mode")

zenmode.setup {
    window = {
        width = 250,
        height = 55,
        options = {}
    },
}

vim.keymap.set("n", "<leader>z", function()
    zenmode.toggle()

    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
end)
