local highlight = vim.cmd.highlight
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

opt.background = "dark"
cmd.colorscheme("retrobox")

highlight("FloatBorder ctermfg=236 ctermbg=234 guifg=#cccccc guibg=#000000")
highlight("Error cterm=bold,reverse ctermfg=203 ctermbg=234 gui=NONE guifg=NONE guibg=NONE")

-- colors for splits
-- highlight("VertSplit guifg=#808080 guibg=#1e1e1e")
-- highlight("VertSplit guifg=#202020 guibg=#202020")

if g.colors_name == "kanagawa" or "kanagawa-dragon" then
    -- git diff signs
    highlight("DiffAdd cterm=reverse blend=100 ctermfg=1 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
    highlight("DiffDelete cterm=reverse ctermfg=142 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
    highlight("DiffChange cterm=reverse ctermfg=107 ctermbg=NONE gui=NONE guifg=#8ec07c guibg=NONE")

    highlight("TelescopeSelection ctermfg=234 ctermbg=109 guifg=#ffffff guibg=#002233")
    highlight("TelescopeMatching ctermfg=208 guifg=#00eaff")

    -- line column on the left
    highlight("LineNr guibg=NONE guifg=#999999")
end

if g.colors_name == "retrobox" then
    -- git diff signs
    highlight("DiffAdd cterm=reverse blend=100 ctermfg=1 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
    highlight("DiffDelete cterm=reverse ctermfg=142 ctermbg=NONE gui=NONE guifg=#b8bb26 guibg=NONE")
    highlight("DiffChange cterm=reverse ctermfg=107 ctermbg=NONE gui=NONE guifg=#8ec07c guibg=NONE")

    highlight("TelescopeSelection ctermfg=234 ctermbg=109 guifg=#ffffff guibg=#3d2004")
    highlight("TelescopeMatching ctermfg=208 guifg=#ffab66")

    highlight("DiagnosticError cterm=bold gui=bold guifg=#f33636")
end

if g.colors_name == "habamax" then
    -- command area color
    -- highlight("ModeMsg cterm=bold ctermfg=214 gui=bold guifg=#fabd2f guibg=NONE")
    highlight("ModeMsg cterm=bold ctermfg=214 gui=bold guifg=#007799 guibg=NONE")

    -- visual line selection
    -- highlight("Visual ctermfg=234 ctermbg=109 guifg=#000000 guibg=#3d6c6c")
    highlight("Visual ctermfg=234 ctermbg=109 guifg=#000000 guibg=#2c5b5b")
    -- highlight("Visual ctermfg=234 ctermbg=109 guifg=#1c1c1c guibg=#5d8c8c")
    -- highlight("Visual ctermfg=234 ctermbg=109 guifg=#1c1c1c guibg=#83a598")

    highlight("TelescopeSelection ctermfg=234 ctermbg=109 guifg=#ffffff guibg=#002233")
    highlight("TelescopeMatching ctermfg=208 guifg=#00eaff")
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
