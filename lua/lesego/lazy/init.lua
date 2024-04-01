return {
  {
    "rose-pine/nvim",
    name = 'rose-pine',
    config = function() 
      vim.cmd('colorscheme rose-pine')
    end
  },

  {
    "nvim-lua/plenary.nvim",
    name = "plenary"
  },

  {
    "folke/trouble.nvim",
    config = function() 
      require("trouble").setup {
        icons = false,
      }
    end
  },

  { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  "mbbill/undotree",
  
  "tpope/vim-fugitive",

  "Pocco81/auto-save.nvim",

  "lewis6991/gitsigns.nvim",

  "theprimeagen/harpoon",
}
