local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- { "wbthomason/packer.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },

	{ "nvim-telescope/telescope.nvim" },
	{ "ThePrimeagen/harpoon" },
	{ "mbbill/undotree" },
	{ "folke/zen-mode.nvim" },
	{ "mrjones2014/smart-splits.nvim" },
	{ "SmiteshP/nvim-navic" },
    { "nvim-pack/nvim-spectre" },
    { "rcarriga/nvim-notify" },

	-- Terminal
	{ "akinsho/toggleterm.nvim" },

	-- File manager
	-- use { "lmburns/lf.nvim" } -- toggleterm lf
	-- { "tamago324/lir.nvim" },
	-- First install neovim-remote `pipx install neovim-remote`
	-- use { "tamago324/lir-mmv.nvim" }
	{ "tamago324/lir-git-status.nvim" },
	-- Fix error while opening directory in lir
	{ "tpope/vim-vinegar" },
    { 'stevearc/oil.nvim' },

	-- Treesitter & related
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "andymass/vim-matchup" },
	{ "numToStr/Comment.nvim" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "gbprod/php-enhanced-treesitter.nvim" },
	{ "derekstride/tree-sitter-sql" },
	{ "tpope/vim-surround" },
	-- use { "lukas-reineke/indent-blankline.nvim" }
	{ "windwp/nvim-autopairs" },

	-- Colors
	{ "lunarvim/darkplus.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{
		"rose-pine/neovim",
		as = "rose-pine",
		-- config = function(
		--     vim.cmd('colorscheme rose-pine'
		-- end
	},

	-- Statusline & tabline
	{ "nvim-lualine/lualine.nvim" },
	{ "akinsho/bufferline.nvim" },
	-- This plugin scopes buffers to tabs cleaning up tabline plugins like bufferline.nvim.
	{ "tiagovla/scope.nvim" },
	{ "moll/vim-bbye" },
	-- use { "jose-elias-alvarez/buftabline.nvim" }

	-- Git
	{ "tpope/vim-fugitive" },
    { "kdheepak/lazygit.nvim" },
	{ "lewis6991/gitsigns.nvim" },

	-- LSP & linting & formatting
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "ray-x/lsp_signature.nvim" },
	{ "j-hui/fidget.nvim", tag = "legacy" },
	{ "simrat39/symbols-outline.nvim" },
	-- use { "nvim-lua/lsp-status.nvim" }
	-- use { "neoclide/coc.nvim", tag = "release" }
	{ "othree/html5.vim" },
	{ "jwalton512/vim-blade" },
	-- use { "mfussenegger/nvim-lint" }
	-- use { "mhartington/formatter.nvim" }
	{ "stevearc/conform.nvim" },

	-- CMP
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "onsails/lspkind.nvim" },
	-- Bootstrap
	-- use { 'jezda1337/nvim-html-css' }
	{ "Jezda1337/cmp_bootstrap" },

	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "rafamadriz/friendly-snippets" },
}

require("lazy").setup(plugins)
