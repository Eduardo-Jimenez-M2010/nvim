-- Lspconfig language setup
-- LSP configuration
-- :h mason-lspconfig-quickstart [optional]
-- :h mason-lspconfig-automatic-server-setup [optional]
--
-- :h mason-lspconfig-commands
    -- :LspInstall [<server>...]
    -- :LspUninstall <server> ...

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        'clangd', 'jdtls', 'pyright',
        'lua_ls', 'html', 'tsserver',
        'phpactor', 'cssls'
    }
}

local config = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
    opts.buffer = bufnr

    -- set keybinds
    opts.desc = "Show LSP references"
    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- Show definition, references

    opts.desc = "Go to declaration"
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definitions"
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
    opts.desc = "Show LSP implementations"
    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Show LSP type definitions"
    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "See available code actions"
    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Show line diagnostics"
    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "Go to previous diagnostic"
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

    opts.desc = "Go to next diagnostic"
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

    opts.desc = "Show documentation for what is under cursor"
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Restart LSP"
    vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- Lua configuration
config.lua_ls.setup {
    capabilities = capabilities,
    on_attach    = on_attach,
    settings = {
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")]   = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                }
            }
        }
    }
}

-- Html configuration
config.html.setup {
    capabilities = capabilities,
    on_attach    = on_attach,
}

config.tsserver.setup {
    capabilities = capabilities,
    on_attach    = on_attach,
}

config.cssls.setup {
    capabilities = capabilities,
    on_attach    = on_attach,
}

config.phpactor.setup {
    capabilities = capabilities,
    on_attach    = on_attach,
}

-- C/C++ configuration
config.clangd.setup {
    capabilities = capabilities,
    on_attach    = on_attach,

    cmd = { "clangd", "--background-index" },
    init_options = {
        compilationDatabasePath = ".",
        clangdFileStatus = true
    },
    args = {
        --"--query-driver=/usr/bin/gcc,/usr/bin/g++",
        --"--extra-arg=-I./lib"
    }
}

-- Java configuration
config.jdtls.setup {
    capabilities = capabilities,
    on_attach    = on_attach,
}

-- Python configuration
config.pyright.setup {
    capabilities = capabilities,
    on_attach    = on_attach,
}
