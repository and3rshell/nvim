vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  desc = "Disable auto comment on newline",
  callback = function()
    vim.opt_local.formatoptions:remove { "c", "r", "o" }
  end,
})
