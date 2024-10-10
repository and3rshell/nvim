local telescope = require("telescope")
local actions = require("telescope.actions")
local actions_layout = require("telescope.actions.layout")
local builtin = require("telescope.builtin")
local putils = require("telescope.previewers.utils")

local keymap_opts = { silent = true }

telescope.load_extension("git_worktree")
telescope.load_extension("dir")
telescope.load_extension("ui-select")

-- vim.keymap.set(
--     "n",
--     "<leader>b",
--     ":Telescope buffers previewer=false initial_mode=normal prompt_title=Buffers<CR>",
--     keymap_opts
-- )

vim.keymap.set("n", "<C-p>", ":Telescope git_files hidden=true no_ignore=true<CR>", keymap_opts)
vim.keymap.set("n", "<M-f>", ":Telescope git_files hidden=true no_ignore=true<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>fg", ":Telescope git_files hidden=true no_ignore=true<CR>", keymap_opts)
vim.keymap.set("n", "<leader>ff", ":Telescope find_files hidden=true no_ignore=true<CR>", keymap_opts)
-- vim.keymap.set("n", "<M-f>", ":Telescope find_files hidden=true no_ignore=true<CR>", keymap_opts)

vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", keymap_opts)
vim.keymap.set("n", "<leader>fH", ":Telescope highlights<CR>", keymap_opts)
vim.keymap.set("n", "<leader>fd", ":Telescope diagnostics initial_mode=normal<CR>", keymap_opts)
-- vim.keymap.set("n", "<leader>fr", ":Telescope registers<CR>", keymap_opts)
-- git commits, git status, highlights, search history, vim_options

vim.keymap.set("n", "<leader>gl", ":Telescope live_grep<CR>", keymap_opts)

vim.keymap.set('n', '<leader>gg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- vim.keymap.set("n", "<leader>gw", function()
--     -- ex. will search for "DO" when there is "DO.not"
--     local word = vim.fn.expand("<cword>")
--     builtin.grep_string({ search = word })
-- end, keymap_opts)

-- vim.keymap.set("n", "<leader>gW", function()
--     -- ex. will search for "DO.not"
--     local word = vim.fn.expand("<cWORD>")
--     builtin.grep_string({ search = word })
-- end, keymap_opts)

vim.keymap.set("n", "<leader>gd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })

telescope.setup({
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
        -- preview = {
        --     -- 1) Do not show previewer for certain files
        --     filetype_hook = function(filepath, bufnr, opts)
        --         -- you could analogously check opts.ft for filetypes
        --         local excluded = vim.tbl_filter(function(ending)
        --             return filepath:match(ending)
        --         end, {
        --             ".*%.csv",
        --             ".*%.toml",
        --             ".*%.sql",
        --         })
        --         if not vim.tbl_isempty(excluded) then
        --             putils.set_preview_message(
        --                 bufnr,
        --                 opts.winid,
        --                 string.format("I don't like %s files!", excluded[1]:sub(5, -1))
        --             )
        --             return false
        --         end
        --         return true
        --     end,
        --     -- 2) Truncate lines to preview window for too large files
        --     filesize_hook = function(filepath, bufnr, opts)
        --         local path = require("plenary.path"):new(filepath)
        --         -- opts exposes winid
        --         local height = vim.api.nvim_win_get_height(opts.winid)
        --         local lines = vim.split(path:head(height), "[\r]?\n")
        --         vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
        --     end,
        -- },
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
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        }
    }
})
