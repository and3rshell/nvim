vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
vim.keymap.set("n", "<leader>gd", ":Git diff<CR><C-w>k:q!<CR>")
vim.keymap.set("n", "<leader>gl", ":Git log<CR><C-w>k:q!<CR>")
vim.keymap.set("n", "<leader>ga", ":Git add .<CR>")

local opts = { buffer = bufnr, remap = false }
vim.keymap.set("n", "<leader>gP", function()
    vim.cmd.Git('push')
end, opts)

-- vim.keymap.set("n", "<leader>gP", function()
--     vim.cmd.Git({'pull',  '--rebase'})
-- end, opts)
