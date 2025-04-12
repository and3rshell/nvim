return {
  "nvim-pack/nvim-spectre",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("custom.spectre")
  end,
}
