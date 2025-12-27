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
        'clangd'  , 'jdtls', 'pyright',
        'lua_ls'  , 'html' , 'biome',
        'phpactor', 'cssls', 'bashls',
        'asm_lsp', 'texlab'
    }
}

-- Setting keybindings for every language
-- local config = vim.lsp.config()
-- lcoal config = require("lspconfig")
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
local opts = { noremap = true, silent = true }
local on_attach = function(client, bufnr)
    opts.buffer = bufnr

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

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Lua configuration
vim.lsp.config('lua_ls', {
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
})

-- Html configuration
vim.lsp.config('html', {
    capabilities = capabilities,
    on_attach    = on_attach,
})

vim.lsp.config('biome', {
    capabilities = capabilities,
    on_attach    = on_attach,
    cmd = { "biome", "lsp-proxy" },
    filetypes = {
        "astro", "css", "graphql", "javascript", "javascriptreact",
        "json", "jsonc", "svelte", "typescript", "typescript.tsx",
        "typescriptreact", "vue"
    }
})

vim.lsp.config('cssls', {
    capabilities = capabilities,
    on_attach    = on_attach,
})

vim.lsp.config('phpactor', {
    capabilities = capabilities,
    on_attach    = on_attach,
})

-- C/C++ configuration
vim.lsp.config('clangd', {
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
    },
    filetypes = { 'c', 'cpp' }
})

-- Java configuration
vim.lsp.config('jdtls', {
    capabilities = capabilities,
    on_attach    = on_attach,
})

-- Python configuration
vim.lsp.config('pyright', {
    capabilities = capabilities,
    on_attach    = on_attach,
})

vim.lsp.config('texlab', {
    capabilities = capabilities,
    on_attach    = on_attach,
})

-- BashScrip configuration
vim.lsp.config('bashls', {
    capabilities = capabilities,
    on_attach    = on_attach,
})

-- Assembler configuration
vim.lsp.config('asm_lsp', {
    filetypes = { "asm", "s", "masm", "nasm" },
    root_dir = config.util.root_pattern(".git") or vim.loop.cwd,
    settings = {
        capabilities = capabilities,
        on_attach    = on_attach,
    }
})
