vim.keymap.set("n", "<leader>e", ':Lf<CR>')
vim.keymap.set("n", "<leader>E", ':LfWorkingDirectory<CR>')
vim.keymap.set("n", "<leader>g", ':FloatermNew lazygit<CR>')

vim.keymap.set("n", "<C-t>", ':FloatermToggle<CR>')
vim.keymap.set("t", "<C-t>", '<C-\\><C-n>:FloatermToggle<CR>')

vim.keymap.set("t", "<C-j>", '<C-\\><C-n>:FloatermNext<CR>')
vim.keymap.set("t", "<C-k>", '<C-\\><C-n>:FloatermPrev<CR>')
vim.keymap.set("t", "<C-a>", '<C-\\><C-n>:FloatermNew<CR>')
vim.keymap.set("t", "<C-q>", '<C-\\><C-n>:FloatermKill<CR>')

vim.cmd [[
    let g:floaterm_width = 130
    let g:floaterm_height = 35
]]
