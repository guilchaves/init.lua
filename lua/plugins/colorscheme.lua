return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = "kanagawa",
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            undercurl = true,
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            transparency = true,
            theme = "wave",
            background = {
                dark = "wave",
                light = "lotus",
            },
        })
        vim.cmd.colorscheme("kanagawa-wave")

        function ColorMyPencils(color)
            color = color or "kanagawa-wave"
            vim.cmd.colorscheme(color)
            vim.opt.signcolumn = "no"
            vim.cmd [[
                highlight CursorLineNr ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
            ]]
            --            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            --            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        end
    end,
}

-- return {
-- 	"crispybaccoon/evergarden",
-- 	lazy = false,
-- 	name = "evergarden",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("evergarden")
-- 		require("evergarden").setup({
-- 			contrast_dark = "medium",
-- 			override_terminal = true,
-- 			style = {
-- 				tabline = { reverse = true, color = "green" },
-- 				search = { rever = false, inc_rever = true },
-- 				types = { italic = true },
-- 				keyword = { italic = true },
-- 				comment = { italic = false },
-- 			},
-- 		})
--
-- 		function ColorMyPencils(color)
-- 			color = color or "evergarden"
-- 			vim.cmd.colorscheme(color)
--
-- 			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 		end
-- 	end,
-- }
