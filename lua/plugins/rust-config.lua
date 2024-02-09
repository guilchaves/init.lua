return {
	"simrat39/rust-tools.nvim",
	config = function()
        local rt = require("rust-tools")
		require("rust-tools").setup({
			server = {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<Leader>gh", rt.hover_actions.hover_actions, { buffer = bufnr })
					vim.keymap.set("n", "<Leader>r", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
            tools = {
                hover_actions = {
                    auto_focus = true,
                }
            }
		})
	end,
}
