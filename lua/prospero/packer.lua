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
    use { "windwp/nvim-autopairs", commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e" }
    use { "ThePrimeagen/harpoon", commit = "21f4c47c6803d64ddb934a5b314dcb1b8e7365dc" }
    use { "nvim-lualine/lualine.nvim", commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63" }
    use { "vimwiki/vimwiki", commit = "f0fe154ede6b11e3db9b058b930005a056a3d1c6" }
    use { "mbbill/undotree", commit = "0e11ba7325efbbb3f3bebe06213afa3e7ec75131" }
    use { "folke/zen-mode.nvim", commit = "68f554702de63f4b7b6b6d4bcb10178f41a0acc7" }

    -- colors and icons
    use { "lunarvim/darkplus.nvim", commit = "7c236649f0617809db05cd30fb10fed7fb01b83b" }
    use { "kyazdani42/nvim-web-devicons", commit = "cfc8824cc1db316a276b36517f093baccb8e799a" }
    -- use("nvim-tree/nvim-tree.lua")
    -- use("nvim-tree/nvim-web-devicons")
    use { "tamago324/lir.nvim", commit = "969e95bd07ec315b5efc53af69c881278c2b74fa" }
    use { "tamago324/lir-git-status.nvim", commit = "4d574f6a9e6d7ce3fe6cccb87a601fb72fb0404d" }

    -- treesitter and related
    use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate', commit = "8fa7ce35afe88b8294e6ced757aa14ec98414568" }
    use { "nvim-treesitter/nvim-treesitter-context", commit = "5dd8c2121170f806c3d0689d9e0dd24250e4f342" }
    -- use("andymass/vim-matchup")
    use { "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "9bff161dfece6ecf3459e6e46ca42e49f9ed939f" }
    use { "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" } -- ex. cs"', ds", ysiw]

    -- lsp
    use { "neovim/nvim-lspconfig", commit = "67f151e84daddc86cc65f5d935e592f76b9f4496" }
    use { "williamboman/mason.nvim", commit = "a51c2d063c5377ee9e58c5f9cda7c7436787be72" }
    use { "williamboman/mason-lspconfig.nvim", commit = "7e8208a4d936f93303cc229af865a2cd226c807f" }
    -- use("onsails/lspkind.nvim")
    -- use("ray-x/lsp_signature.nvim")
    use {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        -- commit = "89b633f3bd0b7187f070236b348697de176860e2"
    }
    use { 'simrat39/symbols-outline.nvim', commit = "512791925d57a61c545bc303356e8a8f7869763c"}

    -- cmp
    use { "hrsh7th/nvim-cmp", commit = "51f1e11a89ec701221877532ee1a23557d291dd5" }
    use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }
    use { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }
    use { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }
    use { "hrsh7th/cmp-cmdline", commit = "8ee981b4a91f536f52add291594e89fb6645e451" }
    use { "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" }
    use { 'hrsh7th/cmp-nvim-lua', commit = "f12408bdb54c39c23e67cab726264c10db33ada8" }
    use { 'jezda1337/nvim-html-css', commit = "47cfa2d3f165954c71fe86591c054b48bdc14e20" } -- bootstrap

    -- snippets
    use { "L3MON4D3/LuaSnip", commit = "c4d6298347f7707e9757351b2ee03d0c00da5c20" }
    use { "rafamadriz/friendly-snippets", commit = "377d45475b49e37460a902d6d569d2093d4037d0" }

    use { 'yaegassy/coc-blade', commit = "527b0ca8ca6a2fac7a20896b4a3222ce5689f945" }
    use { 'https://github.com/jwalton512/vim-blade', commit = "9534101808cc320eef003129a40cab04b026a20c" }

    -- fix error while opening directory in lir
    use { "tpope/vim-vinegar", commit = "bb1bcddf43cfebe05eb565a84ab069b357d0b3d6" }

    -- git
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

    -- tabline
    use { "akinsho/bufferline.nvim", commit = "417b303328118b6d836ae330142e88771c48a8a3" }
    use { "tiagovla/scope.nvim", commit = "48c88376a9dbed96aaf33268b369c14850836fad" } -- This plugin scopes buffers to tabs cleaning up tabline plugins like bufferline.nvim.
    use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
    use { "jose-elias-alvarez/buftabline.nvim" }

    use { "lukas-reineke/indent-blankline.nvim", commit = "9637670896b68805430e2f72cf5d16be5b97a22a" }
end)
