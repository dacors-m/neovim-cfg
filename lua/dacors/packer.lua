vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use ({
      'christoomey/vim-tmux-navigator',
      lazy = false,
  })

  use ({
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  })

  use ({ "catppuccin/nvim", as = "catppuccin" })

  use ({ 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} })

  use ('ThePrimeagen/harpoon')
  use ('mbbill/undotree')
  use ('tpope/vim-fugitive')
  use ('fatih/vim-go')
  use ('eandrju/cellular-automaton.nvim')
  use ('folke/which-key.nvim')
  use ('nvim-tree/nvim-web-devicons')
  use ({
        'nvim-lualine/lualine.nvim', 
         requires = { 'nvim-tree/nvim-web-devicons', opt = true } 
  })
  use ({'github/copilot.vim'})

  use ({'tpope/vim-dadbod'})
  use ({'kristijanhusak/vim-dadbod-ui'})

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  end)


