return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "iceberg_dark",
				icons_enabled = true,
			},
			sections = {
				lualine_c = { { "filename", path = 1 } },
			},
			dependencies = { "nvim-tree/nvim-web-devicons" },
		})
	end,
}
