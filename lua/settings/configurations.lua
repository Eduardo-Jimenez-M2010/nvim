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

vim.opt.wrap = true
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


-- Disable backup file
vim.opt.backup = false
vim.opt.writebackup = false

-- NvimTree
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
