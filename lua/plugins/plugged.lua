-- Pluging list
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug ('morhetz/gruvbox')
    Plug ('scrooloose/nerdtree')
    Plug ('luochen1990/rainbow')
    Plug ('vim-airline/vim-airline') -- bottom status line
    Plug ('tmsvg/pear-tree')
    Plug ('alvan/vim-closetag')
    Plug ('alpaca-tc/vim-endwise')
    Plug ('jeffkreeftmeijer/vim-numbertoggle')
    Plug ('williamboman/mason.nvim')
    Plug ('williamboman/mason-lspconfig.nvim')
    Plug ('neovim/nvim-lspconfig')
vim.call('plug#end')

-- LSP configuration
--:h mason-lspconfig-quickstart otional
--:h mason-lspconfig-automatic-server-setup optional

--:h mason-lspconfig-commands
    --:LspInstall [<server>...]
    --:LspUninstall <server> ...

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { 'clangd', 'jdtls' },
}

-- Lspconfig language setup
require("lspconfig").clangd.setup {}
require("lspconfig").jdtls.setup {}

-- Gruvbox theme settings
vim.g.gruvbox_contrast_dark  = 'medium'
vim.g.gruvbox_transparent_bg = 1
vim.g.gruvbox_bold = 1

-- NerdTree comands mapping
vim.keymap.set('n', '<Leader>n', ':NERDTreeFocus<CR>' , { noremap = true })
vim.keymap.set('n', '<C-n>'    , ':NERDTree<CR>'      , { noremap = true })
vim.keymap.set('n', '<C-t>'    , ':NERDTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<C-f>'    , ':NERDTreeFind<CR>'  , { noremap = true })

-- Raunbow pluging settings
vim.g.rainbow_active = 1
--let g:rainbow_conf = {
--\    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
--\    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
--\    'guis': [''],
--\    'cterms': [''],
--\    'operators': '_,_',
--\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
--\    'separately': {
--\        '*': {},
--\        'markdown': {
--\            'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
--\        },
--\        'lisp': {
--\            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], "lisp needs more colors for parentheses :)
--\        },
--\        'haskell': {
--\            'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], "the haskell lang pragmas should be excluded
--\        },
--\        'vim': {
--\            'parentheses_options': 'containedin=vimFuncBody', "enable rainbow inside vim function body
--\        },
--\        'perl': {
--\            'syn_name_prefix': 'perlBlockFoldRainbow', "solve the [perl indent-depending-on-syntax problem](https://github.com/luochen1990/rainbow/issues/20)
--\        },
--\        'stylus': {
--\            'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], "[vim css color](https://github.com/ap/vim-css-color) compatibility
--\        },
--\        'css': 0, "disable this plugin for css files
--\    }
--\}
