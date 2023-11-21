-- require('rose-pine').setup({
--     disable_background = true
-- })

local highlight = vim.cmd.highlight
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

opt.background = "dark"
cmd.colorscheme("retrobox")
-- cmd.colorscheme("habamax")

highlight("FloatBorder ctermfg=236 ctermbg=234 guifg=#cccccc guibg=#000000")
highlight("Error cterm=bold,reverse ctermfg=203 ctermbg=234 gui=NONE guifg=NONE guibg=NONE")

-- highlight("VertSplit guifg=#808080 guibg=#1e1e1e")
-- highlight("VertSplit guifg=#202020 guibg=#202020")

-- if g.colors_name == "retrobox" then
highlight("DiffAdd cterm=reverse ctermfg=142 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
highlight("DiffDelete cterm=reverse ctermfg=142 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
highlight("DiffChange cterm=reverse ctermfg=107 ctermbg=NONE gui=NONE guifg=#8ec07c guibg=NONE")

highlight("TelescopeSelection ctermfg=234 ctermbg=109 guifg=#ffffff guibg=#3d2004")
highlight("TelescopeMatching ctermfg=208 guifg=#ffab66")

highlight("DiagnosticError cterm=bold gui=bold guifg=#f33636")
-- end

if g.colors_name == "habamax" then
    -- highlight("ModeMsg cterm=bold ctermfg=214 gui=bold guifg=#fabd2f guibg=NONE")
    highlight("ModeMsg cterm=bold ctermfg=214 gui=bold guifg=#007799 guibg=NONE")
    highlight("Visual ctermfg=234 ctermbg=109 guifg=#1c1c1c guibg=#5d8c8c")
    -- highlight("Visual ctermfg=234 ctermbg=109 guifg=#1c1c1c guibg=#83a598")
end

g.transparent_background = true
g.italic_comments = true
g.italic_keywords = true
g.italic_functions = true
g.italic_variables = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#040404" })
vim.api.nvim_set_hl(0, "FloatermBorder", { bg = "none" })

highlight("EndOfBuffer guibg=NONE ctermbg=NONE")
highlight("StatusLine guibg=NONE ctermbg=NONE")
highlight("SignColumn guibg=NONE ctermbg=NONE")
highlight("MsgArea guibg=NONE ctermbg=NONE")
