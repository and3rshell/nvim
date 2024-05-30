-- require("git-worktree").setup({
--     change_directory_command = <str> -- default: "cd",
--     update_on_change = <boolean> -- default: true,
--     update_on_change_command = <str> -- default: "e .",
--     clearjumps_on_change = <boolean> -- default: true,
--     autopush = <boolean> -- default: false,
-- })

-- local telescope = require("telescope")
-- local keymap_opts = { silent = true }

-- telescope.load_extension("git_worktree")
-- vim.keymap.set("n", "<leader>gw", function()
--     telescope.extensions.git_worktree.git_worktrees()
-- end, keymap_opts)
