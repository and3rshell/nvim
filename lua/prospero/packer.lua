local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    print("Installing packer...")
end

local packer = require ("packer")

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-telescope/telescope.nvim")
    use("nvim-lua/popup.nvim")
    use("lewis6991/impatient.nvim")
    use("windwp/nvim-autopairs")
    use("ThePrimeagen/harpoon")
    use("nvim-lualine/lualine.nvim")
    use("vimwiki/vimwiki")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")

    -- colors and icons
    use { "catppuccin/nvim", as = "catppuccin" }
    use("lunarvim/darkplus.nvim")
    use("shaunsingh/nord.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("nvim-tree/nvim-tree.lua")
    -- use("nvim-tree/nvim-web-devicons")
    -- use("tamago324/lir.nvim")
    -- use("tamago324/lir-git-status.nvim")

    -- treesitter and related
    use("nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'})
    use("andymass/vim-matchup")
    use("numToStr/Comment.nvim")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("tpope/vim-surround")

    -- lsp
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("onsails/lspkind.nvim")
    use("ray-x/lsp_signature.nvim")

    -- cmp
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-nvim-lsp")
    use('hrsh7th/cmp-nvim-lua')

    -- snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- bufferline and related
    use("akinsho/bufferline.nvim")
    use("tiagovla/scope.nvim") -- This plugin scopes buffers to tabs cleaning up tabline plugins like bufferline.nvim.
    use("moll/vim-bbye")
end)
