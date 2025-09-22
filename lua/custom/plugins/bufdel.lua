return {
  "ojroques/nvim-bufdel",
  config = function()
    require("bufdel").setup({
      next = "tabs",
      quit = true, -- quit Neovim when last buffer is closed
    })

    vim.keymap.set("n", "<leader>dd", "<cmd>BufDel<cr>")
    vim.keymap.set("n", "<leader>df", "<cmd>BufDel!<cr>")
    vim.keymap.set("n", "<leader>do", "<cmd>:BufDelOthers!<cr>")
    vim.keymap.set("n", "<leader>da", "<cmd>:BufDelAll!<cr>")
  end,
}
