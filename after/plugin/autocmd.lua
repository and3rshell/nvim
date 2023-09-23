vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "Xresources", "Xdefaults", "xresources", "xdefaults" },
    callback = function()
        vim.api.nvim_buf_set_option(0, 'filetype', 'xdefaults')
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "Xresources", "Xdefaults", "xresources", "xdefaults" },
    callback = function()
        vim.cmd [[ !xrdb % ]]
    end,
})

-- vim.cmd [[
--     autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
-- ]]

vim.api.nvim_create_autocmd({ "FileType" }, {
    -- pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir", "fugitive" },
    pattern = { "qf", "man", "lspinfo", "spectre_panel", "lir" },
    callback = function()
        vim.api.nvim_buf_set_option(0, 'buflisted', true)
        vim.keymap.set("n", "q", ":close<CR>")
    end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = function(event)
        if vim.bo[event.buf].filetype == 'help' or vim.bo[event.buf].filetype == 'fugitive' then
            vim.api.nvim_buf_set_option(0, 'buflisted', true)
            vim.cmd.only()
        end
    end,
})

-- vim.api.nvim_create_autocmd({ "FileType" }, {
--     pattern = { "help", "fugitive" },
--     callback = function()
--         vim.cmd("wincmd L")
--     end
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
    end,
})

vim.cmd [[
    augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdlineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
    augroup END
]]
