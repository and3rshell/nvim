local nvim_tree = require("nvim-tree")
local nvim_tree_config = require("nvim-tree.config")
local tree_cb = nvim_tree_config.nvim_tree_callback

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

nvim_tree.setup {
    filters = {
        dotfiles = false,
        -- custom = { ".git" },
        custom = { },
        exclude = {  },
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    git = {
        enable = false,
        -- ignore = true,
        -- show_on_dirs = true,
        -- show_on_open_dirs = true,
        -- timeout = 400,
    },
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        adaptive_size = true,
        number = true,
        relativenumber = true,
        side = "left",
        mappings = {
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = { "<c-c>", "q" }, cb = tree_cb "close" },
                { key = "h", cb = tree_cb "close_node" },
                { key = "<c-s>", cb = tree_cb "split" },
                { key = "<c-x>", cb = tree_cb "vsplit" },
                { key = "mf", cb = tree_cb "create" },
                { key = "dd", cb = tree_cb "remove" },
                { key = "D", cb = tree_cb "trash" },
                { key = "r", cb = tree_cb "rename" },
                { key = "R", cb = tree_cb "full_rename" },
                -- { key = "<c-r>", cb = tree_cb "rename_basename" },
                { key = "<c-r>", cb = tree_cb "refresh" },
                { key = "x", cb = tree_cb "cut" },
                { key = "p", cb = tree_cb "paste" },
                { key = "y", cb = tree_cb "copy" },
                { key = "zh", cb = tree_cb "copy" },
            },
        },
    },
}
