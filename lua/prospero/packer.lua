local fn = vim.fn

local ensure_packer = function()
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    snapshot_path = fn.stdpath "config" .. "/snapshots",
    max_jobs = 50,
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
        prompt_border = "rounded", -- Border style of prompt popups.
    },
}

return require('packer').startup(function(use)
    use { "wbthomason/packer.nvim", commit = "90f794d01dd5f50404f8ef6e1d22377ba5180787" }
    use { "nvim-lua/plenary.nvim", commit = "267282a9ce242bbb0c5dc31445b6d353bed978bb" }
    use { "nvim-telescope/telescope.nvim" }
    use { "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }
    use { "windwp/nvim-autopairs", commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e" }
    use { "ThePrimeagen/harpoon", commit = "21f4c47c6803d64ddb934a5b314dcb1b8e7365dc" }
    use { "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" }
    use { "mbbill/undotree", commit = "0e11ba7325efbbb3f3bebe06213afa3e7ec75131" }
    use { "folke/zen-mode.nvim", commit = "68f554702de63f4b7b6b6d4bcb10178f41a0acc7" }
    use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }
    use { "nvim-treesitter/nvim-treesitter-context" }
    use { "andymass/vim-matchup", commit = "6dbe108230c7dbbf00555b7d4d9f6a891837ef07" }
    use { "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "9bff161dfece6ecf3459e6e46ca42e49f9ed939f" }
    use { "gbprod/php-enhanced-treesitter.nvim", commit = "9032da69daf0cb51b034ad972af1be121690e7c" }
    use { "derekstride/tree-sitter-sql", commit = "f04e4b1fbf7ec43aba7ef65851acc44c14171bcc" }
    use { "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" }
    use { "lukas-reineke/indent-blankline.nvim", commit = "9637670896b68805430e2f72cf5d16be5b97a22a" }

    use { "lunarvim/darkplus.nvim", commit = "7c236649f0617809db05cd30fb10fed7fb01b83b" }
    use { "kyazdani42/nvim-web-devicons", commit = "cfc8824cc1db316a276b36517f093baccb8e799a" }
    use { "tamago324/lir.nvim", commit = "969e95bd07ec315b5efc53af69c881278c2b74fa" }
    use { "tamago324/lir-git-status.nvim", commit = "4d574f6a9e6d7ce3fe6cccb87a601fb72fb0404d" }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    -- use("onsails/lspkind.nvim")
    -- use("ray-x/lsp_signature.nvim")
    use {
        'j-hui/fidget.nvim',
        tag = 'legacy'
    }
    use { 'simrat39/symbols-outline.nvim', commit = "512791925d57a61c545bc303356e8a8f7869763c" }
    -- use { "nvim-lua/lsp-status.nvim", commit = "54f48eb5017632d81d0fd40112065f1d062d0629" }

    -- Linting & formatting
    use { "mfussenegger/nvim-lint" }
    -- use { "mhartington/formatter.nvim" }

    -- CMP
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-cmdline" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { 'hrsh7th/cmp-nvim-lua' }
    -- bootstrap
    use { 'jezda1337/nvim-html-css' }

    -- Snippets
    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }

    use { 'yaegassy/coc-blade', commit = "527b0ca8ca6a2fac7a20896b4a3222ce5689f945" }
    use { 'https://github.com/jwalton512/vim-blade', commit = "9534101808cc320eef003129a40cab04b026a20c" }

    -- Fix error while opening directory in lir
    use { "tpope/vim-vinegar", commit = "bb1bcddf43cfebe05eb565a84ab069b357d0b3d6" }

    -- Git
    use { "tpope/vim-fugitive", commit = "b3b838d690f315a503ec4af8c634bdff3b200aaf" }
    use {
        'lewis6991/gitsigns.nvim',
        commit = "749267aaa863c30d721c9913699c5d94e0c07dd3"
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    --     require("toggleterm").setup()
    -- end }
    use { 'voldikss/vim-floaterm', commit = "bcaeabf89a92a924031d471395054d84bd88ce2f" }
    use { 'ptzz/lf.vim', commit = "e77c40a5ff3e900fb2c348939c636667df647bc8" } -- used with floaterm

    -- Tabline
    use { "akinsho/bufferline.nvim" }
    -- This plugin scopes buffers to tabs cleaning up tabline plugins like bufferline.nvim.
    use { "tiagovla/scope.nvim" }
    use { "moll/vim-bbye" }
    use { "jose-elias-alvarez/buftabline.nvim" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
