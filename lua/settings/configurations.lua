-- EDITOR CONFIGURATIONS


-- Line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Code indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd.filetype({ 'indent', 'plugin', 'on' })
vim.opt.backspace = { 'indent', 'eol', 'start' }

vim.opt.wrap = false
vim.opt.signcolumn = 'yes'

-- Clipboard and cursor configurations
vim.opt.clipboard:append('unnamedplus')
vim.opt.guicursor = { n = block, v = block, c = block, i = block }
vim.opt.backup = false --disable backup file

-- Syntax highligting configuration
vim.cmd.syntax('on')
vim.opt.background = 'dark'
vim.opt.colorcolumn = '80'
vim.opt.termguicolors = false

-- Color Theme
-- default
-- Color Theme options
-- gruvbox installed
-- palenight not installed
-- habamax
-- murphy
-- evening
-- lunaperche
-- slate
-- torte
-- desert
-- industry
-- sorbet
vim.cmd.colorscheme('gruvbox')

-- Disable backup file
vim.opt.backup = false
vim.opt.writebackup = false

