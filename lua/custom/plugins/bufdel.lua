return {
  "ojroques/nvim-bufdel",
  config = function()
    require("bufdel").setup({
      next = "tabs",
      quit = false, -- quit Neovim when last buffer is closed
    })

    vim.keymap.set("n", "<space>dd", "<cmd>BufDel<cr>")
    vim.keymap.set("n", "<space>df", "<cmd>BufDel!<cr>")
    vim.keymap.set("n", "<space>do", "<cmd>:BufDelOthers<cr><cr>")
    vim.keymap.set("n", "<space>da", "<cmd>:BufDelAll<cr><cr>")
  end,
}
