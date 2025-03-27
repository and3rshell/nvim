return {
	"tjdevries/php.nvim",
	enabled = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("php").setup({})
	end,
}
