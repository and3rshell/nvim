vim.cmd [[
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use <c-x> to trigger completion
    if has('nvim')
        inoremap <silent><expr> <c-e> coc#refresh()
    else
        inoremap <silent><expr> <c-2> coc#refresh()
    endif

    let g:coc_global_extensions = [ '@yaegassy/coc-laravel', "coc-blade" ]
]]
