return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-telescope/telescope-ui-select.nvim",
        "kkharji/sqlite.lua",
    },
    config = function()
        require "custom.telescope"
    end,
}
