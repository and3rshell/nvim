local bufferline = require("bufferline")

vim.keymap.set("n", "L", ":BufferLineCycleNext<CR>")
vim.keymap.set("n", "H", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "ZL", ":BufferLineMoveNext<CR>")
vim.keymap.set("n", "ZH", ":BufferLineMovePrev<CR>")
vim.keymap.set("n", "<C-m>", ":BufferLinePick<CR>")
vim.keymap.set("n", "<leader>d", ":Bdelete!<CR>")
vim.cmd[[ nnoremap <expr><silent> <leader>, &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>" ]]

bufferline.setup {
    options = {
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                padding = 0,
                separator = false
            }
        },
        separator = false,
        separator_style = { "", "" },
        always_show_bufferline = false,
        enforce_regular_tabs = true,
        indicator = { style = 'none' },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_tab_indicators = true,
        color_icons = true,
    },
    highlights = {
        tab_selected = {
            fg = '#ffffff',
        }
    }
}

