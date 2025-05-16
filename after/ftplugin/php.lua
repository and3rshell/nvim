vim.opt.commentstring = "// %s"

vim.cmd([[
    " command! FuncSearch execute "/\\%(protected\\|public\\|private\\)\\zs.*function.*"
    command! FuncSearch execute "/\\%(protected\\|public\\|private\\)\.*function.*"
]])

vim.keymap.set("n", "<leader>/F", ":FuncSearch<CR>")
vim.keymap.set("n", "<leader>/f", "/fun.*")
vim.keymap.set("n", "<leader>/c", "/case\\|default.*:$<CR>")
