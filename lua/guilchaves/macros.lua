local M = {}

function M.insert_quack_log()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local row = cursor_pos[1] - 1
	local col = cursor_pos[2]

	local current_line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]
	local new_line = current_line:sub(1, col) .. 'console.log("🦆 quack quack!");' .. current_line:sub(col + 1)

	vim.api.nvim_buf_set_lines(0, row, row + 1, false, { new_line })
	vim.api.nvim_win_set_cursor(0, { row + 1, col + #'console.log("🦆 quack quack!");' })
end

function M.insert_quack()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)
	local row = cursor_pos[1] - 1
	local col = cursor_pos[2]

	local current_line = vim.api.nvim_buf_get_lines(0, row, row + 1, false)[1]
	local new_line = current_line:sub(1, col) .. '🦆 quack quack!' .. current_line:sub(col + 1)

	vim.api.nvim_buf_set_lines(0, row, row + 1, false, { new_line })
	vim.api.nvim_win_set_cursor(0, { row + 1, col + #'🦆 quack quack!' })
end


return M
