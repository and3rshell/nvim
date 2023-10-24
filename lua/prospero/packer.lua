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
        prompt_border = "curved", -- Border style of prompt popups.
    },
}

return require('packer').startup(function(use)
    use { "wbthomason/packer.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "nvim-lua/popup.nvim" }

    use { "nvim-telescope/telescope.nvim" }
    use { "ThePrimeagen/harpoon" }
    use { "mbbill/undotree" }
    use { "folke/zen-mode.nvim" }

    -- Terminal
    use { "akinsho/toggleterm.nvim", tag = '*'}

    -- File manager
    -- use { "lmburns/lf.nvim" } -- toggleterm lf
    use { "tamago324/lir.nvim" }
    -- First install neovim-remote `pipx install neovim-remote`
    -- use { "tamago324/lir-mmv.nvim" }
    use { "tamago324/lir-git-status.nvim" }
    -- Fix error while opening directory in lir
    use { "tpope/vim-vinegar" }

    -- Treesitter & related
    use { "nvim-treesitter/nvim-treesitter", run = ':TSUpdate' }
    use { "nvim-treesitter/nvim-treesitter-context" }
    use { "andymass/vim-matchup" }
    use { "numToStr/Comment.nvim" }
    use { "JoosepAlviste/nvim-ts-context-commentstring" }
    use { "gbprod/php-enhanced-treesitter.nvim" }
    use { "derekstride/tree-sitter-sql" }
    use { "tpope/vim-surround" }
    -- use { "lukas-reineke/indent-blankline.nvim" }
    use { "windwp/nvim-autopairs" }

    -- Colors
    use { "lunarvim/darkplus.nvim" }
    use { "kyazdani42/nvim-web-devicons" }
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        -- config = function()
        --     vim.cmd('colorscheme rose-pine')
        -- end
    })

    -- Statusline & tabline
    use { "nvim-lualine/lualine.nvim" }
    use { "akinsho/bufferline.nvim" }
    -- This plugin scopes buffers to tabs cleaning up tabline plugins like bufferline.nvim.
    use { "tiagovla/scope.nvim" }
    use { "moll/vim-bbye" }
    -- use { "jose-elias-alvarez/buftabline.nvim" }

    -- Git
    use { "tpope/vim-fugitive" }
    use { 'lewis6991/gitsigns.nvim' }

    -- LSP & linting & formatting
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "ray-x/lsp_signature.nvim" }
    use { 'j-hui/fidget.nvim', tag = 'legacy' }
    use { 'simrat39/symbols-outline.nvim' }
    -- use { "nvim-lua/lsp-status.nvim" }
    -- use { "neoclide/coc.nvim", tag = "release" }
    use { "othree/html5.vim" }
    use { 'jwalton512/vim-blade' }
    -- use { "mfussenegger/nvim-lint" }
    -- use { "mhartington/formatter.nvim" }
    use { "stevearc/conform.nvim" }

    -- CMP
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-cmdline" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { "onsails/lspkind.nvim" }
    -- Bootstrap
    -- use { 'jezda1337/nvim-html-css' }
    use { 'Jezda1337/cmp_bootstrap' }

    -- Snippets
    use { "L3MON4D3/LuaSnip" }
    use { "rafamadriz/friendly-snippets" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        packer.sync()
    end
end)
