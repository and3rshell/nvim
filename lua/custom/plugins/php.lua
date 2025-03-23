return {
    "tjdevries/php.nvim",
    enabled = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
        -- lspconfig needed
    },
    config = function()
        require("php").setup({})
    end
}
