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
    { "princejoogie/dir-telescope.nvim" },

    { "ThePrimeagen/harpoon" },
    { "mbbill/undotree" },
    { "folke/zen-mode.nvim" },
    { "mrjones2014/smart-splits.nvim" },
    -- { "SmiteshP/nvim-navic" },
    { "nvim-pack/nvim-spectre" },
    { "rcarriga/nvim-notify" },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            'smoka7/hydra.nvim',
        },
        opts = {},
        cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
        keys = {
            {
                mode = { 'v', 'n' },
                '<leader>n',
                '<cmd>MCstart<cr>'
            },
            {
                mode = { 'v', 'n' },
                '<leader>N',
                '<cmd>MCpattern<cr>'
            },
        },
    },
    { "kwkarlwang/bufjump.nvim" },

    -- File manager
    -- Fix error while opening directory in lir
    -- { "tpope/vim-vinegar" },
    { "stevearc/oil.nvim" },

    -- Treesitter & related
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "andymass/vim-matchup" },
    { "numToStr/Comment.nvim" },
    { "JoosepAlviste/nvim-ts-context-commentstring" },
    { "gbprod/php-enhanced-treesitter.nvim" },
    { "derekstride/tree-sitter-sql" },
    { "lukas-reineke/indent-blankline.nvim" },
    { "windwp/nvim-autopairs" },
    -- { "tpope/vim-surround" },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- Colors
    { "lunarvim/darkplus.nvim" },
    -- { "kyazdani42/nvim-web-devicons" },
    { "nvim-tree/nvim-web-devicons" },
    {
        "rose-pine/neovim",
        as = "rose-pine",
        -- config = function(
        --     vim.cmd('colorscheme rose-pine'
        -- end
    },

    -- Statusline & tabline & buffers
    { "nvim-lualine/lualine.nvim" },
    { "akinsho/bufferline.nvim" },
    -- This plugin scopes buffers to tabs cleaning up tabline plugins like bufferline.nvim.
    { "tiagovla/scope.nvim" },
    { "moll/vim-bbye" },
    -- use { "jose-elias-alvarez/buftabline.nvim" }
    { "j-morano/buffer_manager.nvim" },

    -- Terminal & Git
    -- { "tpope/vim-fugitive" },
    { "akinsho/toggleterm.nvim" },
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
    { "overleaf/vim-env-syntax" },
    -- { "haringsrob/laravel-dev-tools" }, -- blade lsp, doesn't work with nvim
    -- { "neoclide/coc.nvim", branch = "release" },

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
    -- { "rafamadriz/friendly-snippets" },

    { "ActivityWatch/aw-watcher-vim" },
    { "nyngwang/NeoZoom.lua" }
}

require("lazy").setup(plugins)
