return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- CustomOilBar = function()
        --     local path = vim.fn.expand "%"
        --     path = path:gsub("oil://", "")
        --
        --     return "  " .. vim.fn.fnamemodify(path, ":.")
        -- end

        require "custom.oil"
  end,
}
