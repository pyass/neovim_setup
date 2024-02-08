local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end
vim.cmd('packadd packer.nvim')
local packer = require 'packer'
local util = require 'packer.util'
packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})
--- startup and add configure plugins
packer.startup(function()
    local use = use
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'junegunn/vim-easy-align'
    use 'tpope/vim-surround'
    use 'tpope/vim-speeddating'
    use 'tpope/vim-commentary'
    use 'tpope/vim-unimpaired'
    use 'wsdjeg/vim-todo'
    use 'mhartington/formatter.nvim'
    use 'scrooloose/syntastic'
    use 'mattn/emmet-vim'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-repeat'
    use 'akinsho/toggleterm.nvim'
    use 'theprimeagen/harpoon'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'jay-babu/mason-nvim-dap.nvim'
    use {"mfussenegger/nvim-dap-python", requires = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    }}
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-cmdline' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use 'nvim-lualine/lualine.nvim'
    use 'folke/tokyonight.nvim'
    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }
    use { "folke/trouble.nvim"}
end
)
