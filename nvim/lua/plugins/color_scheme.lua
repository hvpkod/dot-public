return {
	-- add gruvbox
	{ "ellisonleao/gruvbox.nvim", lazy = true },

	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
	},

	{ -- Theme inspired by Atom
		"navarasu/onedark.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("onedark")
		end,
	},

	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			integrations = {
				aerial = true,
				alpha = true,
				cmp = true,
				dashboard = true,
				flash = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				markdown = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
		},
	},

	{
		"rose-pine/neovim",
		lazy = true,
		priority = 1000,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				highlight_groups = {
					TelescopeResultsTitle = { fg = "surface", bg = "surface" },
					TelescopeBorder = { fg = "surface", bg = "surface" },
					TelescopeSelection = { fg = "text", bg = "overlay", bold = true },
					TelescopeSelectionCaret = { fg = "text", bg = "highlight_med" },
					TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

					TelescopeTitle = { fg = "base", bg = "love" },
					TelescopePromptTitle = { fg = "base", bg = "love" },
					TelescopePreviewTitle = { fg = "base", bg = "foam" },

					TelescopePromptNormal = { bg = "overlay" },
					TelescopePromptBorder = { fg = "overlay", bg = "overlay" },
					TelescopePromptPrefix = { fg = "love", bg = "overlay" },
					NvimTreeCursorLine = { bg = "surface" },
					NvimTreeNormal = { bg = "#161420" },
					NvimTreeWinSeparator = { bg = "#161420", fg = "#161420" },
					CmpWinBorder = { fg = "overlay", bg = "base" },
				},
			})
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- Configure LazyVim to load x
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
}
