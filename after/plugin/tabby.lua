vim.o.showtabline = 1
vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'

local theme = {
  fill = { fg='#f2e9de', bg='#010101' },
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  -- on the left
  -- head = { fg='#000000', bg='#000000', style='italic' },
  current_tab = { fg='#f2e9de', bg='#031a36' },
  tab = { fg='#f2e9de', bg='#000000' },
  -- on the right
  win = { fg='#f2e9de', bg='#000000' },
  -- tail = { fg='#f2e9de', bg='#123123', style='italic' },
}

-- TabLine        xxx ctermfg=234 ctermbg=243 guifg=#1c1c1c guibg=#767676
-- TabLineSel     xxx cterm=bold gui=bold
-- TabLineFill    xxx ctermfg=234 ctermbg=243 guifg=#1c1c1c guibg=#767676

require('tabby').setup({
  line = function(line)
    return {
      -- {
      --   -- { '  ', hl = theme.head },
      --   line.sep('', theme.head, theme.fill),
      -- },
      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab
        return {
          line.sep(' ', hl, theme.fill),
          tab.is_current() and '',
          -- tab.number(),
          tab.name(),
          tab.close_btn('x'),
          line.sep(' ', hl, theme.fill),
          hl = hl,
          margin = ' ',
        }
      end),
      line.spacer(),
      -- line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
        -- return {
        --   line.sep(' ', theme.win, theme.fill),
        --   win.is_current() and '' or '',
        --   win.buf_name(),
        --   line.sep(' ', theme.win, theme.fill),
        --   -- hl = th.win,
        --   margin = ' ',
        -- }
      -- end),
      -- {
      --   line.sep(' ', theme.tail, theme.fill),
      --   { '  ', hl = theme.tail },
      -- },
      hl = theme.fill,
    }
  end,
  -- option = {}, -- setup modules' option,
})

vim.api.nvim_set_keymap("n", "<leader>n", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tq", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>.", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>,", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader><", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>>", ":+tabmove<CR>", { noremap = true })
