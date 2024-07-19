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
        'lua_ls', 'html', 'tsserver'
    }
}

local config = require("lspconfig")

-- Lua configuration
config.lua_ls.setup {}

-- Html configuration
config.html.setup {}

config.tsserver.setup {}

-- C/C++ configuration
config.clangd.setup {
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
config.jdtls.setup {}

-- Python configuration
--local on_attach = config.on_attach
--local capabilities = config.capabilities
config.pyright.setup {
    --on_attach = on_attach,
    --capabilities = capabilities,
    --filetypes = {"python"},
}
