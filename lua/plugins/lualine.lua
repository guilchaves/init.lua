return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "base16",
			},
			dependencies = { "nvim-tree/nvim-web-devicons" },
		})
	end,
}
