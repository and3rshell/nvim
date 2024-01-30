local opts = { silent=true, noremap=true }
vim.api.nvim_set_keymap("n", "<M-o>", ":lua require('bufjump').backward()<cr>", opts)
vim.api.nvim_set_keymap("n", "<M-i>", ":lua require('bufjump').forward()<cr>", opts)
