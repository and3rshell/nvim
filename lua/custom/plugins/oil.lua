return {
    "stevearc/oil.nvim",
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
