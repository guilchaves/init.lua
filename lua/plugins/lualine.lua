return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "iceberg_dark",
                icons_enabled = true,
			},
			dependencies = { "nvim-tree/nvim-web-devicons" },
		})
	end,
}
