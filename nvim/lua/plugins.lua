local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require("lazy").setup {
	-- nvim-neo-tree
	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
	},	
	-- status line
	{ "nvim-lualine/lualine.nvim" }, 
	
	-- themes
	{ "ful1e5/onedark.nvim" },
	{ "marko-cerovac/material.nvim" },
  { "sainnhe/edge"},

	-- highlighting
	{ "nvim-treesitter/nvim-treesitter" },

	-- buffer
	{ "akinsho/bufferline.nvim" },
	{ "kyazdani42/nvim-web-devicons" },
	{ "moll/vim-bbye" },

	-- which key 
	{ "folke/which-key.nvim" },


	-- lsp 
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },

	-- auto complete
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/vim-vsnip" }, 
	{ "hrsh7th/cmp-buffer" }, 
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },

	-- indentation
	{ "lukas-reineke/indent-blankline.nvim" },
	
	-- comments
	{
    'numToStr/Comment.nvim',
    opts = {
    },
    lazy = false,
	},

	-- formatter
	{ "nvim-lua/plenary.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" }, 
	
	-- smooth scroll 
	{ "karb94/neoscroll.nvim" },
	
	-- auto pairs
	{ "windwp/nvim-autopairs" }, 

	-- fuzzy finder
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },

	-- dashboard 
	{ "goolord/alpha-nvim" },
}

