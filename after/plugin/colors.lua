require('rose-pine').setup({
    disable_background = true
})

vim.o.background = "dark"
vim.cmd.colorscheme("retrobox")
-- vim.cmd.colorscheme("habamax")

vim.cmd.highlight("FloatBorder ctermfg=236 ctermbg=234 guifg=#cccccc guibg=#000000")
vim.cmd.highlight("Error cterm=bold,reverse ctermfg=203 ctermbg=234 gui=NONE guifg=NONE guibg=NONE")

-- vim.cmd.highlight("VertSplit guifg=#808080 guibg=#1e1e1e")
-- vim.cmd.highlight("VertSplit guifg=#202020 guibg=#202020")

-- if vim.g.colors_name == "retrobox" then
vim.cmd.highlight("DiffAdd cterm=reverse ctermfg=142 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
vim.cmd.highlight("DiffDelete cterm=reverse ctermfg=142 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
vim.cmd.highlight("DiffChange cterm=reverse ctermfg=107 ctermbg=NONE gui=NONE guifg=#8ec07c guibg=NONE")

vim.cmd.highlight("TelescopeSelection ctermfg=234 ctermbg=109 guifg=#ffffff guibg=#3d2004")
vim.cmd.highlight("TelescopeMatching ctermfg=208 guifg=#ffab66")

vim.cmd.highlight("DiagnosticError cterm=bold gui=bold guifg=#f33636")
-- end

if vim.g.colors_name == "habamax" then
    -- vim.cmd.highlight("ModeMsg cterm=bold ctermfg=214 gui=bold guifg=#fabd2f guibg=NONE")
    vim.cmd.highlight("ModeMsg cterm=bold ctermfg=214 gui=bold guifg=#007799 guibg=NONE")
    vim.cmd.highlight("Visual ctermfg=234 ctermbg=109 guifg=#1c1c1c guibg=#5d8c8c")
    -- vim.cmd.highlight("Visual ctermfg=234 ctermbg=109 guifg=#1c1c1c guibg=#83a598")
end

vim.g.transparent_background = true
vim.g.italic_comments = true
vim.g.italic_keywords = true
vim.g.italic_functions = true
vim.g.italic_variables = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#090909" })
vim.api.nvim_set_hl(0, "FloatermBorder", { bg = "none" })

vim.cmd.highlight("EndOfBuffer guibg=NONE ctermbg=NONE")
vim.cmd.highlight("StatusLine guibg=NONE ctermbg=NONE")
vim.cmd.highlight("SignColumn guibg=NONE ctermbg=NONE")
vim.cmd.highlight("MsgArea guibg=NONE ctermbg=NONE")
