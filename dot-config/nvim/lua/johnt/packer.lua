-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "catppuccin/nvim", as = "catppuccin" }

  use({
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup()
    end,
  })

  use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
      end,
  }

  use ( 'nvim-treesitter/playground' )

  use ( 'theprimeagen/harpoon' )

  use ( 'mbbill/undotree' )

  use ( 'tpope/vim-fugitive' )

  use {
      'hrsh7th/nvim-cmp',
      required = {
          'hrsh7th/cmp-buffer',     -- Source for words in the current buffer
          'hrsh7th/cmp-path',       -- Source for file system paths
          'hrsh7th/cmp-nvim-lsp',   -- Source for LSP suggestions
      }
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
      'akinsho/bufferline.nvim', 
      tag = "*", 
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

end)
