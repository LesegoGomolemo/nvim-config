vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        requires = {
          {'nvim-lua/plenary.nvim'} 
        }
    }

    use {
        'rose-pine/nvim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
    }

    use 'theprimeagen/harpoon'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'


    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    use { "Pocco81/auto-save.nvim" }
    use 'lewis6991/gitsigns.nvim'
    use 'ThePrimeagen/vim-be-good'

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require("ibl").setup()
      end
    }

    use {
      'folke/todo-comments.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' }
      },
      config = function()
        require('todo-comments').setup()
      end
    }

    use {
      "akinsho/toggleterm.nvim",
      tag = '*',
      config = function()
        require("toggleterm").setup({
          direction = 'float',
          open_mapping = [[vt]]
        })
      end
    }
end)
