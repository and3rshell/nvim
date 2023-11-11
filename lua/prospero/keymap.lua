vim.keymap.set("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "ZZ", ":w<CR>")
vim.keymap.set("n", "<leader>q", "ZQ")
vim.keymap.set("n", "<leader>Q", ":w<CR>:qall<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
-- vim.keymap.set("n", "<C-c>", "ZQ")
vim.cmd("command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!")
vim.cmd("nmap <leader>W :W<CR>")
vim.keymap.set("n", "L", ":bnext<CR>")
vim.keymap.set("n", "H", ":bprev<CR>")
vim.keymap.set("n", "<leader>d", ":Bdelete!<CR>")
vim.cmd[[ nnoremap <expr><silent> <leader>, &showtabline ? ":set showtabline=0\<cr>" : ":set showtabline=2\<cr>" ]]

vim.keymap.set("n", "Y", "y$")
vim.keymap.set("v", "p", '"_dP')
-- vim.keymap.set("x", "<leader>p", "\"_dP")
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+Y")
-- vim.keymap.set("n", "<leader>d", "\"_d")
-- vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>P", "P==")

vim.keymap.set("n", "Q", "gq")
vim.keymap.set("n", "Q", "<nop>")

-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
-- vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
-- vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
-- vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
-- vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "{", "10k")
vim.keymap.set("n", "}", "10j")
vim.keymap.set("v", "{", "10k")
vim.keymap.set("v", "}", "10j")

-- vim.keymap.set("n", "<leader>c", ":noh<CR>")
vim.keymap.set("v", ".", ":normal .<CR>")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<leader>k", "Vyp")
vim.keymap.set("n", "<leader>j", "VyP")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("x", "J", ":move '>+1<CR>gv-gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "K", ":move '<-2<CR>gv-gv")

vim.keymap.set("n", "gch", "I<!-- <esc>A --><esc>0")
vim.keymap.set("n", "gcH", "0df $daw0")
vim.keymap.set("n", "gcp", "I// <esc>0")
vim.keymap.set("n", "gcP", "0df ")
vim.keymap.set("n", "<leader>B", ':!$BROWSER "%"<cr>')
vim.keymap.set("n", "<leader>V", ':!vscodium $(pwd) "%"<CR><CR>')
-- vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>fh", ":set filetype=html<CR>")
vim.keymap.set("n", "<leader>fp", ":set filetype=php<CR>")
vim.keymap.set("n", "<leader>fc", ":set filetype=c<CR>")

vim.keymap.set('n', '<leader>i', function()
    vim.api.nvim_feedkeys('ea', 'n', true)
    require("cmp").mapping.complete()
end)

vim.keymap.set("n", "2o", "o<esc>o")
vim.keymap.set("n", "2O", "O<esc>O")
vim.keymap.set("n", "g;", "A;<esc>")
-- vim.keymap.set("n", "do", "ddko")
vim.keymap.set("n", "cG", "ggcG")
vim.keymap.set("n", "yG", "ggVGy<c-o>")
-- vim.keymap.set("n", "<leader>F", "gg=G<C-o>")

-- Tabs
-- vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>>", ":tabmove +<CR>")
vim.keymap.set("n", "<leader><", ":tabmove -<CR>")

-- Splits
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>x", ":split<CR>")
vim.keymap.set("n", "<leader>K", "<c-w>_ | <c-w>|")
vim.keymap.set("n", "<leader>J", "<c-w>=")

-- Markdown
vim.keymap.set("n", "<C-b>", "i**<esc>ea**<esc>B")
vim.keymap.set("n", "da*", "xxwxxB")
