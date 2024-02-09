return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
        require("toggleterm").setup({
            vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", {}),
            vim.keymap.set("i", "<C-c>", "<Esc>", {})
        })
	end,
}
