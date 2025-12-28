-- Pluging list
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    -- themes
    Plug ('morhetz/gruvbox')
    Plug ('drewtempelmeyer/palenight.vim')
    Plug ('agude/vim-eldar')

    Plug ('nvim-tree/nvim-tree.lua')
    Plug ('vim-airline/vim-airline') -- bottom status line
    Plug ('tmsvg/pear-tree')
    Plug ('alvan/vim-closetag')
    Plug ('alpaca-tc/vim-endwise')
    Plug ('jeffkreeftmeijer/vim-numbertoggle')

    -- lsp server plugins
    Plug ('mfussenegger/nvim-jdtls')
    Plug ('williamboman/mason.nvim')
    Plug ('williamboman/mason-lspconfig.nvim')
    Plug ('hrsh7th/cmp-nvim-lsp')
    Plug ('antosha417/nvim-lsp-file-operations', { config = true })
    Plug ('neovim/nvim-lspconfig')

    Plug ('nvim-lua/plenary.nvim')
    Plug ('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })
    Plug ('nvim-tree/nvim-web-devicons')
    Plug ('nvim-telescope/telescope.nvim', { branch = '0.1.x' })

    Plug ('stevearc/dressing.nvim')

    Plug ('hrsh7th/cmp-buffer')
    Plug ('hrsh7th/cmp-path')
    Plug ('L3MON4D3/LuaSnip')
    Plug ('saadparwaiz1/cmp_luasnip')
    Plug ('rafamadriz/friendly-snippets')
    Plug ('hrsh7th/nvim-cmp')
    Plug ('elkowar/yuck.vim')
vim.call('plug#end')
