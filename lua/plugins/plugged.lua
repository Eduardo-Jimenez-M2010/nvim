-- Pluging list
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
    Plug ('morhetz/gruvbox')
    Plug ('nvim-tree/nvim-tree.lua')
    Plug ('luochen1990/rainbow')
    Plug ('vim-airline/vim-airline') -- bottom status line
    Plug ('tmsvg/pear-tree')
    Plug ('alvan/vim-closetag')
    Plug ('alpaca-tc/vim-endwise')
    Plug ('jeffkreeftmeijer/vim-numbertoggle')

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
vim.call('plug#end')


-- Raunbow pluging settings
vim.g.rainbow_active = 1
-- vim.g:rainbow_conf = {
--   guifgs = ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
--   ctermfgs = ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
--   guis = [''],
--   cterms = [''],
--   operators = '_,_',
--   parentheses = ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
--   separately = {
--      '*': {},
--      'markdown': {
--          'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
--      },
--      'lisp': {
--          'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], "lisp needs more colors for parentheses :)
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
-- }

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
