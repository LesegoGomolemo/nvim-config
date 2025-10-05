local lsp = require('lsp-zero')

lsp.preset('recommended')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'ts_ls', 'rust_analyzer', 'eslint', 'lua_ls', 'html', 'cssls', 'pyright', 'pylsp', 'gopls', 'angularls', 'kotlin_language_server' },
  handlers = {
   --   lsp_zero.default_setup,
  },
})

local ok_lspconfig, lspconfig = pcall(require, 'lspconfig')
local vim_lsp_config = (vim and vim.lsp and vim.lsp.config) or nil

local function server_setup(name, cfg)
  cfg = cfg or {}
  if ok_lspconfig and lspconfig and type(lspconfig[name]) == 'table' and type(lspconfig[name].setup) == 'function' then
    lspconfig[name].setup(cfg)
    return true
  elseif vim_lsp_config and type(vim_lsp_config[name]) == 'table' and type(vim_lsp_config[name].setup) == 'function' then
    vim_lsp_config[name].setup(cfg)
    return true
  else
    return false
  end
end

-- Try ts_ls first, fall back to tsserver
server_setup('ts_ls', {})
server_setup('tsserver', {})

server_setup('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

server_setup('eslint', {})
server_setup('html', {})
server_setup('cssls', {})
server_setup('pyright', {})
server_setup('pylsp', {})
server_setup('gopls', {})
server_setup('angularls', {})
server_setup('kotlin_language_server', {})

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
