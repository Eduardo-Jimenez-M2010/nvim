-- KEY MAPPING


-- Write and Quit comands
vim.g.mapleader = ' ' -- Leader key

vim.keymap.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>q', ':q<CR>')

-- Loading and Opening the main configurations
vim.keymap.set('n', '<Leader>e', ':e ~/.config/nvim<CR>')
vim.keymap.set('n', '<F5>', ':source ~/.config/nvim/init.lua<CR>')

-- Up scroll
vim.keymap.set('n', '<C-k>', '2<C-y>')
-- Down scroll
vim.keymap.set('n', '<C-j>', '2<C-e>')

-- Tabs configurations
vim.keymap.set('n', '<Leader>nt', ':tabnew<CR>'  , { noremap = true })
vim.keymap.set('n', '<Leader>ct', ':tabclose<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>st', ':tab split<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>l' , ':tabnext +<CR>', { noremap = true })
vim.keymap.set('n', '<Leader>h' , ':tabnext -<CR>', { noremap = true })

vim.keymap.set('n', '<leader>t', ':terminal<CR>', { noremap = true })

-- Setting buffers configurations
vim.keymap.set('n', '<leader>buff', ':buffers<CR>'   , { noremap = true })
vim.keymap.set('n', '<leader>j'   , ':bnext<CR>'     , { noremap = true })
vim.keymap.set('n', '<leader>k'   , ':bprevious<CR>' , { noremap = true })
vim.keymap.set('n', '<leader>bd'  , ':bdelete<CR>'   , { noremap = true })

-- Disable directional keys
vim.keymap.set('', '<up>'   , '<nop>', { noremap = true })
vim.keymap.set('', '<down>' , '<nop>', { noremap = true })
vim.keymap.set('', '<left>' , '<nop>', { noremap = true })
vim.keymap.set('', '<right>', '<nop>', { noremap = true })

-- Splits commands settings
vim.keymap.set('n','<right>'    ,':vertical resize +5<CR>', { noremap = true, silent = true })
vim.keymap.set('n','<left>'     ,':vertical resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set('n','<up>'       ,':resize +5<CR>'         , { noremap = true, silent = true })
vim.keymap.set('n','<down>'     ,':resize -5<CR>'         , { noremap = true, silent = true })
vim.keymap.set('n','<Leader>sp' ,':sp<CR>'                , { noremap = true, silent = true })
vim.keymap.set('n','<Leader>vs' ,':vsp<CR>'               , { noremap = true, silent = true })
vim.keymap.set('n','<Leader>t'  ,':term<CR>'              , { noremap = true, silent = true })

-- Moving betwin splits
vim.keymap.set('n', '<Leader><up>'   , '<C-w>k', { noremap = true })
vim.keymap.set('n', '<Leader><down>' , '<C-w>j', { noremap = true })
vim.keymap.set('n', '<Leader><left>' , '<C-w>h', { noremap = true })
vim.keymap.set('n', '<Leader><right>', '<C-w>l', { noremap = true })
