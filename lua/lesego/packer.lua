-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself

    use 'wbthomason/packer.nvim' 
 
    use 'nvim-lua/plenary.nvim'

    use 'mfussenegger/nvim-dap'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use ({
        'rose-pine/nvim',
        as = 'rose-pine',
        config = function() 
            vim.cmd('colorscheme rose-pine')
        end
    })


    use('nvim-treesitter/nvim-treesitter' , { run = 'TSUpdate'})
    use('nvim-treesitter/playground')

    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')


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

    use {
      'akinsho/flutter-tools.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
      },
   }

    use { "Pocco81/auto-save.nvim" }

    use('lewis6991/gitsigns.nvim')

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup({
        direction = 'float',
        open_mapping = [[vt]]
      })
    end}
    
    use { "github/copilot.vim" }
    
    -- use('nvim-tree/nvim-tree.lua') 
end)
