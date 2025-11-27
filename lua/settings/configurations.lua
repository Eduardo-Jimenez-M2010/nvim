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
-- Opens buffers into a new tab
-- vim.api.nvim_create_autocmd("BufReadPost", {
--     callback = function()
--         if vim.fn.argc() > 0 then
--             vim.cmd("tabnew")
--         end
--     end
-- })

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,           opts('Help'))
  -- this redundancy is to override show info command, i didn't find nothing else better :/
  vim.keymap.set('n', '<C-k>', '<C-y>',                        opts('Scroll Down'))
  vim.keymap.set('n', '<C-i>', api.node.show_info_popup,       opts('Info'))
end
-- pass to setup along with your other options
require("nvim-tree").setup {
  on_attach = my_on_attach,
}

-- Telescope
local function telescope_config()
    local telescope = require("telescope")
    local actions   = require("telescope.actions")

    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    -- move to prev result
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-j>"] = actions.move_selection_next,     -- move to next result
                    ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
                }
            }
        }
    }
    telescope.load_extension("fzf")
end
telescope_config()

-- Dressing configuration
require("dressing").setup({
  input = {
    -- Set to false to disable the vim.ui.input implementation
    enabled = true,

    -- Default prompt string
    default_prompt = "Input",

    -- Trim trailing `:` from prompt
    trim_prompt = true,

    -- Can be 'left', 'right', or 'center'
    title_pos = "left",

    -- When true, input will start in insert mode.
    start_in_insert = true,

    -- These are passed to nvim_open_win
    border = "rounded",
    -- 'editor' and 'win' will default to being centered
    relative = "cursor",

    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    prefer_width = 40,
    width = nil,
    -- min_width and max_width can be a list of mixed types.
    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },

    buf_options = {},
    win_options = {
      -- Disable line wrapping
      wrap = false,
      -- Indicator for when text exceeds window
      list = true,
      listchars = "precedes:…,extends:…",
      -- Increase this for more context when text scrolls off the window
      sidescrolloff = 0,
    },

    -- Set to `false` to disable
    mappings = {
      n = {
        ["<Esc>"] = "Close",
        ["<CR>"] = "Confirm",
      },
      i = {
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
        ["<Up>"] = "HistoryPrev",
        ["<Down>"] = "HistoryNext",
      },
    },

    override = function(conf)
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      return conf
    end,

    -- see :help dressing_get_config
    get_config = nil,
  },
  select = {
    -- Set to false to disable the vim.ui.select implementation
    enabled = true,

    -- Priority list of preferred vim.select implementations
    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

    -- Trim trailing `:` from prompt
    trim_prompt = true,

    -- Options for telescope selector
    -- These are passed into the telescope picker directly. Can be used like:
    -- telescope = require('telescope.themes').get_ivy({...})
    telescope = nil,

    -- Options for fzf selector
    fzf = {
      window = {
        width = 0.5,
        height = 0.4,
      },
    },

    -- Options for fzf-lua
    fzf_lua = {
      -- winopts = {
      --   height = 0.5,
      --   width = 0.5,
      -- },
    },

    -- Options for nui Menu
    nui = {
      position = "50%",
      size = nil,
      relative = "editor",
      border = {
        style = "rounded",
      },
      buf_options = {
        swapfile = false,
        filetype = "DressingSelect",
      },
      win_options = {
        winblend = 0,
      },
      max_width = 80,
      max_height = 40,
      min_width = 40,
      min_height = 10,
    },

    -- Options for built-in selector
    builtin = {
      -- Display numbers for options and set up keymaps
      show_numbers = true,
      -- These are passed to nvim_open_win
      border = "rounded",
      -- 'editor' and 'win' will default to being centered
      relative = "editor",

      buf_options = {},
      win_options = {
        cursorline = true,
        cursorlineopt = "both",
      },

      -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
      -- the min_ and max_ options can be a list of mixed types.
      -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
      width = nil,
      max_width = { 140, 0.8 },
      min_width = { 40, 0.2 },
      height = nil,
      max_height = 0.9,
      min_height = { 10, 0.2 },

      -- Set to `false` to disable
      mappings = {
        ["<Esc>"] = "Close",
        ["<C-c>"] = "Close",
        ["<CR>"] = "Confirm",
      },

      override = function(conf)
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        return conf
      end,
    },

    -- Used to override format_item. See :help dressing-format
    format_item_override = {},

    -- see :help dressing_get_config
    get_config = nil,
  },
})

-- Cmp configurations
local function cmp_config()
    local cmp     = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    vim.keymap.set({ "n", "i" }, "<C-Space>", "<nop>", { noremap = true })
    cmp.setup {
        completion = {
            completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert {
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
            ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
            ["<C-e>"] = cmp.mapping.abort(), -- clouse completion window 
            ["<CR>"] = cmp.mapping.confirm({ select = true}),
        },
        sources = cmp.config.sources {
            { name = "nvim_lsp" },
            { name = "luasnip" }, -- snippets
            { name = "buffer" },  -- text within current buffer
            { name = "path" },    -- file system paths
        }
    }
end
cmp_config()
