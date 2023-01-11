-- Run xrdb whenever Xdefaults or Xresources are updated
vim.cmd [[
    augroup xrdb
    autocmd!
        autocmd BufRead,BufNewFile Xresources,Xdefaults,xresources,xdefaults set filetype=xdefaults
        autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
    augroup end
]]

-- Disables automatic commenting on newline
vim.cmd [[
    augroup autocomment
    autocmd!
        autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    augroup end
]]

vim.cmd [[
    autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir", "fugitive" },
    callback = function()
        vim.cmd [[
            set nobuflisted
            nnoremap <silent> <buffer> q :close<CR>
        ]]
    end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
    end,
})

-- Autocomment fix
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    callback = function()
        vim.cmd "set formatoptions-=cro"
    end,
})
