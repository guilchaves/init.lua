return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						padding = 1,
						highlight = "Directory",
						separator = true,
					},
				},
				separator_style = "thin",
			},
		})

		vim.api.nvim_set_keymap("n", "H", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "L", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>bq", ":bdelete!<CR>", { noremap = true, silent = true })
	end,
}
