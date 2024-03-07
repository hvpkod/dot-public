-- Set lualine as statusline
return {
	"nvim-lualine/lualine.nvim",
	-- See `:help lualine.txt`
	opts = {
		options = {
			icons_enabled = true,
			-- theme = 'onedark',
			-- theme = 'gruvbox',
			theme = "catppuccin",
			component_separators = "|",
			section_separators = "",
		},
		sections = {
			lualine_c = {
				{ "filename", path = 1 }, -- Display relative path
				{ "file_status", icon = true },
			},
		},
	},
}
