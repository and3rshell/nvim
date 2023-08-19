local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer, close and reopen Neovim."
    vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
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

return packer.startup(function(use)
    use { "wbthomason/packer.nvim", commit = "90f794d01dd5f50404f8ef6e1d22377ba5180787" }
    use { "nvim-lua/plenary.nvim", commit = "267282a9ce242bbb0c5dc31445b6d353bed978bb" }
    use { "nvim-telescope/telescope.nvim", commit = "2d92125620417fbea82ec30303823e3cd69e90e8" }
    use { "nvim-lua/popup.nvim", commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac" }
    use { "windwp/nvim-autopairs", commit = "" }
    use { "ThePrimeagen/harpoon", commit = "" }
    use { "nvim-lualine/lualine.nvim", commit = "" }
    use { "vimwiki/vimwiki", commit = "" }
    use { "mbbill/undotree", commit = "" }
    use { "folke/zen-mode.nvim", commit = "" }

    -- colors and icons
    use { "lunarvim/darkplus.nvim", commit = "" }
    use { "kyazdani42/nvim-web-devicons", commit = "" }
    -- use("nvim-tree/nvim-tree.lua")
    -- use("nvim-tree/nvim-web-devicons")
    use { "tamago324/lir.nvim", commit = "" }
    use { "tamago324/lir-git-status.nvim", commit = "" }

    -- treesitter and related
    use { "nvim-treesitter/nvim-treesitter", { run = ':TSUpdate' }, commit = "" }
    use { "nvim-treesitter/nvim-treesitter-context", commit = "" }
    -- use("andymass/vim-matchup")
    use { "numToStr/Comment.nvim", commit = "" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "" }
    use { "tpope/vim-surround", commit = "" } -- ex. cs"', ds", ysiw]

    -- lsp
    use { "neovim/nvim-lspconfig", commit = "" }
    use { "williamboman/mason.nvim", commit = "" }
    use { "williamboman/mason-lspconfig.nvim", commit = "" }
    -- use("onsails/lspkind.nvim")
    -- use("ray-x/lsp_signature.nvim")

    -- cmp
    use { "hrsh7th/nvim-cmp", commit = "" }
    use { "hrsh7th/cmp-buffer", commit = "" }
    use { "hrsh7th/cmp-path", commit = "" }
    use { "saadparwaiz1/cmp_luasnip", commit = "" }
    use { "hrsh7th/cmp-cmdline", commit = "" }
    use { "hrsh7th/cmp-nvim-lsp", commit = "" }
    use { 'hrsh7th/cmp-nvim-lua', commit = "" }
    use { 'jezda1337/cmp_bootstrap', commit = "" }

    -- snippets
    use { "L3MON4D3/LuaSnip", commit = "" }
    use { "rafamadriz/friendly-snippets", commit = "" }

    use { 'yaegassy/coc-blade', commit = "" }
    use { 'https://github.com/jwalton512/vim-blade', commit = "" }

    -- fix error while opening directory in lir
    use { "tpope/vim-vinegar", commit = "" }

    -- git
    use { "tpope/vim-fugitive", commit = "" }
    use {
        'lewis6991/gitsigns.nvim',
        commit = ""
        -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    -- use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    --     require("toggleterm").setup()
    -- end }
    use { 'voldikss/vim-floaterm', commit = "" }
    use { 'ptzz/lf.vim', commit = "" } -- used with floaterm

    -- tabline
    use { "akinsho/bufferline.nvim", commit = "" }
    use { "tiagovla/scope.nvim", commit = "" } -- This plugin scopes buffers to tabs cleaning up tabline plugins like bufferline.nvim.
    use { "moll/vim-bbye", commit = "" }
    use { "jose-elias-alvarez/buftabline.nvim", commit = "" }

    use {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        commit = ""
    }
end)
