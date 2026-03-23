-- use lazynvim to manage the plugins
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
	{ "navarasu/onedark.nvim" },
  { "sainnhe/edge"},
	{ "Mofiqul/vscode.nvim"},
	{ "sainnhe/sonokai" },

	-- highlighting
	{ "nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ':TSUpdate'
	},

	-- which key
	{ "folke/which-key.nvim" },

	-- lsp
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },

	-- auto complete
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-buffer" },

	-- indentation
	{ "lukas-reineke/indent-blankline.nvim" },

	-- highlighting cursor word
	{ "rrethy/vim-illuminate" },

	-- comments
	{
    'numToStr/Comment.nvim',
    opts = {
    },
    lazy = false,
	},

	-- auto pairs
	{ "windwp/nvim-autopairs" },

	-- auto saves
	{ "Pocco81/auto-save.nvim" },

	-- fuzzy finder
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim" },

	-- dashboard
	{ "goolord/alpha-nvim" },

	-- toggle terminal
	{'akinsho/toggleterm.nvim',
		version = "*",
		config = true
	},

	-- boookmark
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	}

}

