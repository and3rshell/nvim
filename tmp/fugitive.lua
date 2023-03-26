vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>gS", ":enew<CR>:Git show<CR><C-w>k:q!<CR>")
