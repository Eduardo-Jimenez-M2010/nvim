"Linux version

let mapleader=' '

" Write and Quit commads
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

"Loading and Opening the configuration file
nnoremap <F5> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>e :e ~/.config/nvim/init.vim<CR>

"Scroll commands mapping

"Up scroll
nnoremap <C-k> 2<C-y>
"Down scroll
nnoremap <C-j> 2<C-e>

noremap <C-h> <nop>
noremap <C-l> <nop>

" Scroll horizontal hacia la izquierda con Alt + H
nnoremap <C-h> :let w:scrollstart=getpos('.')<Bar>normal! 0<Bar>let &sidescroll = &sidescroll + v:count1<CR>

" Scroll horizontal hacia la derecha con Alt + L
nnoremap <C-l> :let w:scrollstart=getpos('.')<Bar>normal! g0<Bar>let &sidescroll = &sidescroll - v:count1<CR>

"Syntax highligting configuration
syntax on
set background=dark
set colorcolumn=80
"set termguicolors
"Line enumeration

set nu
set rnu

"Code indenting
set tabstop=4
set softtabstop=4
set smartindent
set shiftwidth=4
set expandtab
filetype indent plugin on
set backspace=indent,eol,start

set nowrap
set signcolumn=yes

"Clipboard and cursor configuration
set clipboard+=unnamedplus
set guicursor=n-v-c-i:block
set nobackup "disable backup file


set nobackup "disable backub file
set nowritebackup

" Tabs settings
noremap <leader>nt :tabnew<CR>
noremap <leader>ct :tabclose<CR>
noremap <leader>st :tab split<CR>
noremap <leader>l  :tabnext +<CR>
noremap <leader>h  :tabnext -<CR>

"noremap <leader>t :terminal<CR>

" Setting buffers configurations
noremap <leader>buff :buffers<CR>
noremap <leader>j  :bnext<CR>
noremap <leader>k  :bprevious<CR>
noremap <leader>bd :bdelete<CR>


" Disable directional keys
noremap <up>    <nop>
noremap <down>  <nop>
noremap <left>  <nop>
noremap <right> <nop>

"Splits commands settings
nnoremap <silent> <right>:vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up>   :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>
noremap  <leader>sp      :sp<CR> 
noremap  <leader>vs      :vsp<CR>
nnoremap <leader>t       :term<CR>
"Moving betwin splits
nnoremap <leader><up> <C-w>k
nnoremap <leader><down> <C-w>j
nnoremap <leader><left> <C-w>h
nnoremap <leader><right> <C-w>l

" Pluging list
call plug#begin("~/.config/nvim/plugged")
    Plug 'morhetz/gruvbox'
    Plug 'scrooloose/nerdtree'
    Plug 'luochen1990/rainbow'
    Plug 'vim-airline/vim-airline' " bottom status line
    Plug 'tmsvg/pear-tree'
    Plug 'alvan/vim-closetag'
    Plug 'alpaca-tc/vim-endwise'
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
call plug#end()

"LSP configuration
":h mason-lspconfig-quickstart otional
":h mason-lspconfig-automatic-server-setup optional

":h mason-lspconfig-commands
    ":LspInstall [<server>...]
    ":LspUninstall <server> ...
"require("mason").setup()
"require("mason-lspconfig").setup()

"Gruvbox theme settings
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_transparent_bg = 1
let g:gruvbox_bold = 1

" Color Theme options
" - gruvbox
" - palenight
" - habamax
" - murphy
" - evening
" - lunaperche
" - slate
" - torte
"colorscheme gruvbox

"NerdTree comands mapping
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Raunbow pluging settings
let g:rainbow_active = 1
"let g:rainbow_conf = {
"\    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
"\    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
"\    'guis': [''],
"\    'cterms': [''],
"\    'operators': '_,_',
"\    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
"\    'separately': {
"\        '*': {},
"\        'markdown': {
"\            'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
"\        },
"\        'lisp': {
"\            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], "lisp needs more colors for parentheses :)
"\        },
"\        'haskell': {
"\            'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], "the haskell lang pragmas should be excluded
"\        },
"\        'vim': {
"\            'parentheses_options': 'containedin=vimFuncBody', "enable rainbow inside vim function body
"\        },
"\        'perl': {
"\            'syn_name_prefix': 'perlBlockFoldRainbow', "solve the [perl indent-depending-on-syntax problem](https://github.com/luochen1990/rainbow/issues/20)
"\        },
"\        'stylus': {
"\            'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], "[vim css color](https://github.com/ap/vim-css-color) compatibility
"\        },
"\        'css': 0, "disable this plugin for css files
"\    }
"\}
