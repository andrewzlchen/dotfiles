-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- search
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- use("theprimeagen/harpoon")
	use("nvim-telescope/telescope-file-browser.nvim")
	-- use("nvim-telescope/telescope-project.nvim")

	-- ui
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			require("onedark").load()
		end,
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		{ run = ":TSUpdate" },
	})
	use("nvim-treesitter/playground")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	})
	use("simrat39/symbols-outline.nvim")

	-- git
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-- programming
	use("airblade/vim-rooter") --- set cwd to project root
	use({
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				library = { plugins = { "neotest" }, types = true },
			})
		end,
	})
	use({
		"rgroli/other.nvim",
		config = function()
			require("other-nvim").setup({
				mappings = {
					-- react.js typescript mappings
					{
						pattern = "(.+)[*.tsx]$",
						target = "%1/%2.test.tsx",
						context = "component",
					},
					{
						pattern = "(.+)[*.tsx]$",
						target = "%1/%2.test.ts",
						context = "component",
					},
					{
						pattern = "/src/(.*)/.*.test.tsx$",
						target = "/src/%1/%1.tsx",
						context = "test",
					},
					{
						pattern = "/src/(.*)/.*.test.ts$",
						target = "/src/%1/%1.tsx",
						context = "test",
					},
					-- react.js javascript mappings
					{
						pattern = "/src/(.*)/.*.jsx$",
						target = "/src/%1/%1.test.jsx",
						context = "component",
					},
					{
						pattern = "/src/(.*)/.*.jsx$",
						target = "/src/%1/%1.test.js",
						context = "component",
					},
					{
						pattern = "/src/(.*)/.*.test.jsx$",
						target = "/src/%1/%1.jsx",
						context = "test",
					},
					{
						pattern = "/src/(.*)/.*.test.js$",
						target = "/src/%1/%1.jsx",
						context = "test",
					},
				},
				transformers = {
					-- defining a custom transformer
					lowercase = function(inputString)
						return inputString:lower()
					end,
				},
				style = {
					-- How the plugin paints its window borders
					-- Allowed values are none, single, double, rounded, solid and shadow
					border = "solid",

					-- Column seperator for the window
					seperator = "|",

					-- width of the window in percent. e.g. 0.5 is 50%, 1.0 is 100%
					width = 0.7,

					-- min height in rows.
					-- when more columns are needed this value is extended automatically
					minHeight = 2,
				},
			})
		end,
	})
	use({
		"mfussenegger/nvim-dap",
		requires = {
			"leoluz/nvim-dap-go",
		},
		config = function()
			require("dap-go").setup()
		end,
	})
	use("tpope/vim-unimpaired")
	use("mhartington/formatter.nvim")
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"nvim-neotest/neotest",
		requires = {
			-- deps
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			-- test-runners
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-go",
		},
		config = function()
			local neotest_ns = vim.api.nvim_create_namespace("neotest")
			vim.diagnostic.config({
				virtual_text = {
					format = function(diagnostic)
						local message =
							diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
						return message
					end,
				},
			}, neotest_ns)

			require("neotest").setup({
				adapters = {
					require("neotest-go"),
					require("neotest-jest")({
						jestCommand = "npm test --",
						jestConfigFile = "custom.jest.config.ts",
						env = { CI = true },
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
				log_level = 0,
			})
		end,
	})
	use("JoosepAlviste/nvim-ts-context-commentstring") -- adds context to commenting plugin
	use("mbbill/undotree")
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
end)
