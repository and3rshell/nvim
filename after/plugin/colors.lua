vim.o.background = "dark"
vim.cmd.colorscheme("retrobox")

if vim.g.colors_name == "retrobox" then
    vim.cmd.highlight("DiffAdd cterm=reverse ctermfg=142 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
    vim.cmd.highlight("DiffDelete cterm=reverse ctermfg=142 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
    vim.cmd.highlight("DiffChange cterm=reverse ctermfg=107 ctermbg=NONE gui=NONE guifg=#8ec07c guibg=NONE")

    vim.cmd.highlight("TelescopeSelection ctermfg=234 ctermbg=109 guifg=#ffffff guibg=#3d2004")
    vim.cmd.highlight("TelescopeMatching ctermfg=208 guifg=#ffab66")
end

-- vim.cmd [[
--     let g:material_theme_style = 'ocean-community'
--     let g:material_terminal_italics = 1
--     colorscheme material
-- ]]

vim.g.transparent_background = true
vim.g.italic_comments = true
vim.g.italic_keywords = true
vim.g.italic_functions = true
vim.g.italic_variables = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

vim.cmd.highlight("EndOfBuffer guibg=NONE ctermbg=NONE")
vim.cmd.highlight("StatusLine guibg=NONE ctermbg=NONE")
vim.cmd.highlight("SignColumn guibg=NONE ctermbg=NONE")
vim.cmd.highlight("MsgArea guibg=NONE ctermbg=NONE")

-- vim.cmd.highlight("VimwikiHeader1 guifg=#00838f gui=bold")
-- vim.cmd.highlight("VimwikiHeader2 guifg=#00bcd4 gui=bold")
-- vim.cmd.highlight("VimwikiHeader3 guifg=#4dd0e1 gui=bold")
-- vim.cmd.highlight("VimwikiHeader4 guifg=#94FBEF gui=bold")
-- vim.cmd.highlight("VimwikiHeader5 guifg=#94FBEF gui=bold")
-- vim.cmd.highlight("VimwikiHeader6 guifg=#94FBEF gui=bold")

-- vim.cmd.highlight("VimwikiLink guifg=#c5e1a5 gui=underline")
-- vim.cmd.highlight("VimwikiHR guifg=#aed581 gui=bold")
-- vim.cmd.highlight("VimwikiList guifg=#71E885 gui=bold")
-- vim.cmd.highlight("VimwikiListTodo guifg=#9f9f9f gui=bold")

-- vim.api.nvim_set_hl(0, "VimwikiList", { link = "VimwikiHeader1" })
-- vim.cmd.highlight("VimwikiList guifg=#ff0000 gui=bold")

vim.cmd.highlight("FidgetTitle ctermfg=110 guifg=#6cb6eb")
vim.cmd.highlight("FidgetTask ctermfg=239 guifg=#ffffff")
