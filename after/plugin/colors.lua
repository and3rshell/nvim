vim.o.background = "dark"
vim.cmd.colorscheme("darkplus")

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

vim.cmd.highlight("VimwikiHeader1 guifg=#00838f gui=bold")
vim.cmd.highlight("VimwikiHeader2 guifg=#00bcd4 gui=bold")
vim.cmd.highlight("VimwikiHeader3 guifg=#4dd0e1 gui=bold")
vim.cmd.highlight("VimwikiHeader4 guifg=#94FBEF gui=bold")
vim.cmd.highlight("VimwikiHeader5 guifg=#94FBEF gui=bold")
vim.cmd.highlight("VimwikiHeader6 guifg=#94FBEF gui=bold")

vim.cmd.highlight("VimwikiLink guifg=#c5e1a5 gui=underline")
vim.cmd.highlight("VimwikiHR guifg=#aed581 gui=bold")
vim.cmd.highlight("VimwikiList guifg=#71E885 gui=bold")
vim.cmd.highlight("VimwikiListTodo guifg=#9f9f9f gui=bold")

-- vim.api.nvim_set_hl(0, "VimwikiList", { link = "VimwikiHeader1" })
-- vim.cmd.highlight("VimwikiList guifg=#ff0000 gui=bold")
