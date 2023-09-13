vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "ZZ", ":w<CR>")
vim.keymap.set("n", "<leader>q", "ZQ")
vim.keymap.set("n", "<leader>w", ":w<CR>")
-- vim.keymap.set("n", "<C-c>", "ZQ")
vim.cmd("command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!")
vim.cmd("nmap <leader>W :W<CR>")

vim.keymap.set("n", "L", ":bnext<CR>")
vim.keymap.set("n", "H", ":bprev<CR>")
vim.keymap.set("n", "<leader>d", ":Bdelete!<CR>")

vim.keymap.set("v", "p", '"_dP')
-- vim.keymap.set("x", "<leader>p", "\"_dP")

-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")

-- vim.keymap.set("n", "<leader>d", "\"_d")
-- vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "Q", "gq")
vim.keymap.set("v", ".", ":normal .<CR>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<leader>k", "Vyp")
vim.keymap.set("n", "<leader>j", "VyP")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>>", ":tabmove +<CR>")
vim.keymap.set("n", "<leader><", ":tabmove -<CR>")
vim.keymap.set("n", "<leader>c", ":noh<CR>")

vim.cmd([[ nmap <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left> ]])
vim.keymap.set("n", "2o", "o<esc>o")
vim.keymap.set("n", "2O", "O<esc>O")
vim.keymap.set("n", "g;", "A;<esc>")
vim.keymap.set("n", "<leader>=", "ggVG=")

vim.keymap.set("n", "<leader><leader>h", ":set filetype=html<CR>")
vim.keymap.set("n", "<leader><leader>p", ":set filetype=php<CR>")

vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>x", ":split<CR>")

vim.keymap.set("n", "<leader>K", "<c-w>_ | <c-w>|")
vim.keymap.set("n", "<leader>J", "<c-w>=")

vim.keymap.set("n", "<leader>S", ":SymbolsOutline<cr>")

vim.keymap.set("n", "<leader>ob", ':!$BROWSER "%"<cr>')
vim.keymap.set("n", "<leader>oc", ':!vscodium "%"<cr>')
vim.keymap.set("n", "do", "ddko")

vim.keymap.set("n", "<C-b>", "i**<esc>ea**<esc>B")
vim.keymap.set("n", "da*", "xxwxxB")

vim.keymap.set("n", "cG", "ggcG")

vim.keymap.set("i", "<C-x>", "<esc>A;")
