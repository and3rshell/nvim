local data = assert(vim.fn.stdpath "data") --[[@as string]]
local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")
local set = vim.keymap.set

require("telescope").setup {
    defaults = {
        path_display = { "smart" },
        initial_mode = "insert",
        layout_config = {
            horizontal = {
                width = 0.5,
                height = 0.8
            }
        },

        file_ignore_patterns = { ".git/", "node_modules" },

        preview = false,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,

                -- ["<C-f>"] = actions.cycle_history_next,
                -- ["<C-b>"] = actions.cycle_history_prev,

                -- doesn't work
                ["<C-f>"] = actions.preview_scrolling_up,
                ["<C-b>"] = actions.preview_scrolling_down,

                ["<C-c>"] = actions.close,
                ["<CR>"] = actions.select_default,

                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,

                ["<C-l>"] = actions_layout.toggle_preview,

                ["<C-u>"] = actions.results_scrolling_up,
                ["<C-d>"] = actions.results_scrolling_down,
            },
            n = {
                ["<esc>"] = actions.close,
                ["q"] = actions.close,
                ["<CR>"] = actions.select_default,

                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-l>"] = actions_layout.toggle_preview,
                ["<C-f>"] = actions.preview_scrolling_up,
                ["<C-b>"] = actions.preview_scrolling_down,

                -- ["<C-f>"] = actions.cycle_history_next,
                -- ["<C-b>"] = actions.cycle_history_prev,

                ["<C-u>"] = actions.results_scrolling_up,
                ["<C-d>"] = actions.results_scrolling_down,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker

            find_files = {
                path_display = { "smart" },
            },
    },
    extensions = {
        wrap_results = true,
        history = {
            path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
            limit = 100,
        },
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    }
}

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "git_worktree")
pcall(require("telescope").load_extension, "dir")
pcall(require("telescope").load_extension, "smart_history")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require "telescope.builtin"

-- TODO use builtin
set("n", "<C-p>", ":Telescope git_files hidden=true no_ignore=true<CR>", keymap_opts)
set("n", "<leader>ff", ":Telescope find_files hidden=true no_ignore=true<CR>", keymap_opts)
set("n", "<leader>fh", builtin.help_tags)
set("n", "<leader>fH", ":Telescope highlights<CR>", keymap_opts)
--set("n", "<leader>fd", ":Telescope diagnostics initial_mode=normal<CR>", keymap_opts)
set("n", "<leader>gl", ":Telescope live_grep<CR>", keymap_opts)
set('n', '<leader>gg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>pws', function()
--     local word = vim.fn.expand("<cword>")
--     builtin.grep_string({ search = word })
-- end)
-- vim.keymap.set('n', '<leader>pWs', function()
--     local word = vim.fn.expand("<cWORD>")
--     builtin.grep_string({ search = word })
-- end)
-- vim.keymap.set('n', '<leader>ps', function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)
-- vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
