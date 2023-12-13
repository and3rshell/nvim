local keymap = vim.keymap.set
local g = vim.g

-- keymap("n", "<leader>gg", ":LazyGit<CR>")
keymap("n", "<C-g>", ":LazyGit<CR>")
-- keymap("n", "<leader>gf", ":LazyGitFilter<CR>")
-- keymap("n", "<leader>gc", ":LazyGitFilterCurrentFile<CR>")

g.lazygit_floating_window_winblend = 0 -- transparency of floating window
g.lazygit_floating_window_scaling_factor = 0.85 -- scaling factor for floating window
g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'} -- customize lazygit popup window border characters
g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
g.lazygit_config_file_path = '' -- custom config file path
-- OR
g.lazygit_config_file_path = {} -- table of custom config file paths
