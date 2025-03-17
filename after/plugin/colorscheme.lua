local highlight = vim.cmd.highlight
local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

opt.background = "dark"
cmd.colorscheme("habamax")

highlight("FloatBorder ctermfg=236 ctermbg=234 guifg=#cccccc guibg=#000000")
highlight("Error cterm=bold,reverse ctermfg=203 ctermbg=234 gui=NONE guifg=NONE guibg=NONE")

-- colors for splits
highlight("VertSplit guifg=#808080 guibg=#1e1e1e")
highlight("VertSplit guifg=#202020 guibg=#202020")

-- vim.cmd [[
--     hi link @keyword.return.php Macro
--     hi link @keyword.modifier.php Structure
--     hi link htmlTag Comment
--     hi link htmlEndTag Comment
--     hi @tag.vue guifg=#cccccc
--     " hi link @tag.delimiter.vue @none.vue
--     hi link @markup.heading.1.vue @variable.member.vue
--     hi @tag.delimiter.vue guifg=#808080
--     " hi htmlString guifg=#808080
-- ]]

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
    -- highlight("Visual ctermfg=109 ctermbg=234 guifg=#2c5b5b guibg=#000000")
    highlight("Visual cterm=reverse ctermfg=109 ctermbg=234 gui=reverse guifg=#497373 guibg=#cccccc")

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
