local lsp = require('lsp-zero')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'ts_ls', 'rust_analyzer', 'eslint', 'lua_ls', 'html', 'cssls', 'pyright', 'pylsp', 'gopls', 'angularls', 'kotlin_language_server' },
    handlers = {
     --   lsp_zero.default_setup,
    },
})

local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup {}
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
}
lspconfig.eslint.setup {}
lspconfig.html.setup {}
lspconfig.cssls.setup {}
lspconfig.pyright.setup {}
lspconfig.pylsp.setup {}
lspconfig.gopls.setup {}
lspconfig.angularls.setup {}
lspconfig.kotlin_language_server.setup {}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['C-p'] = cmp.mapping.select_prev_item(cmp_select),
    ['C-n'] = cmp.mapping.select_next_item(cmp_select),
    ['C-y'] = cmp.mapping.confirm({ select = true }),
    ['C-Space'] = cmp.mapping.complete(),
})


lsp.set_preferences({
    sign_icons = {}
})


lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>hh", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()


cmp.setup({
  mapping = cmp_mappings
})
