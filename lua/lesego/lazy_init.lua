local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = "lesego.lazy",
  change_detection = { notify = false }
})

--[[
require("lazy").setup({
   use {
     'VonHeikemen/lsp-zero.nvim',
     branch = 'v3.x',
     requires = {
       --- Uncomment the two plugins below if you want to manage the language servers from neovim
       -- {'williamboman/mason.nvim'},
       -- {'williamboman/mason-lspconfig.nvim'},

       -- LSP Support
       {'neovim/nvim-lspconfig'},
       -- Autocompletion
       {'hrsh7th/nvim-cmp'},
       {'hrsh7th/cmp-nvim-lsp'},
       {'L3MON4D3/LuaSnip'},
     }
   }
   use {
     "williamboman/mason.nvim",
     "williamboman/mason-lspconfig.nvim",
     "neovim/nvim-lspconfig",
   }
   use {"akinsho/toggleterm.nvim", tag = '*', config = function()
     require("toggleterm").setup({
       direction = 'float',
       open_mapping = [[vt]]
    -- })
   --end}
--}, {})
-- ]]
