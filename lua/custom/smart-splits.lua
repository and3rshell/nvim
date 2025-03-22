local set = vim.keymap.set

-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
set('n', '<C-Left>', require('smart-splits').resize_left)
set('n', '<C-Down>', require('smart-splits').resize_down)
set('n', '<C-Up>', require('smart-splits').resize_up)
set('n', '<C-Right>', require('smart-splits').resize_right)

-- moving between splits
set('n', '<C-h>', require('smart-splits').move_cursor_left)
set('n', '<C-j>', require('smart-splits').move_cursor_down)
set('n', '<C-k>', require('smart-splits').move_cursor_up)
set('n', '<C-l>', require('smart-splits').move_cursor_right)

-- swapping buffers between windows
set('n', '<c-w>h', require('smart-splits').swap_buf_left)
set('n', '<c-w>j', require('smart-splits').swap_buf_down)
set('n', '<c-w>k', require('smart-splits').swap_buf_up)
set('n', '<c-w>l', require('smart-splits').swap_buf_right)

-- set('n', '<leader><leader>r', require('smart-splits').start_resize_mode)
