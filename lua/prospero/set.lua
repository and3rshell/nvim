vim.opt.backup = false -- creates a backup file
vim.opt.swapfile = false -- creates a swapfile
vim.opt.undofile = false -- persistent undo
vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
vim.opt.writebackup = true -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert x spaces for a tab
vim.opt.softtabstop = 4
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.isfname:append("@-@")
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- override the 'ignorecase' option if the search pattern contains upper case characters
vim.opt.updatetime = 50 -- faster completion (4000ms default)
vim.opt.cmdheight = 1 -- command line messages statusline
vim.opt.clipboard = "unnamedplus"
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.showmode = false -- things like -- INSERT --
vim.opt.showcmd = true -- https://vi.stackexchange.com/questions/742/showing-command-history-with-showcmd 
vim.opt.laststatus = 3 -- the value of this option influences when the last window will have a statusline
vim.opt.numberwidth = 4 -- default is 4
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.guifont = "monospace:h11" -- the font used in graphical neovim applications
vim.opt.smartindent = true
vim.opt.showtabline = 0 -- the value of this option specifies when the line with tab page labels will be displayed
vim.opt.pumheight = 10 -- maximum number of items to show in the popup menu
-- vim.opt.conceallevel = 1 -- example: make `` visible in markdown files

vim.cmd("set modifiable")
vim.opt.shortmess:append("c") -- vim default "filnxtToOF"
-- vim.opt.iskeyword:append("-")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
