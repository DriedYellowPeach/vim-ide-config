local M = {}

---@param buf? number
---@param value? boolean
function M.inlay_hints(buf, value)
	local ih = vim.lsp.inlay_hint
	if value == nil then
		value = not ih.is_enabled({ bufnr = buf or 0 })
	end
	ih.enable(value, { bufnr = buf })
end

function M.check_box()
	local unchecked_pattern = "- %[%s+%]"
	local checked_pattern = "- %[x%]"
	local old_line = vim.api.nvim_get_current_line()
	local row = vim.api.nvim_win_get_cursor(0)[1]
	local fresh_line = ""

	if old_line:find(checked_pattern) then
		fresh_line = string.gsub(old_line, checked_pattern, "- [ ]", 1)
	elseif old_line:find(unchecked_pattern) then
		fresh_line = string.gsub(old_line, unchecked_pattern, "- [x]", 1)
	else
		local i, j = old_line:find("^%s*")
		local old_line_head = ""

		if i and j then
			old_line_head = old_line:sub(i, j)
		end

		fresh_line = old_line_head .. "- [ ] " .. old_line:sub(j + 1)
	end

	vim.api.nvim_buf_set_lines(0, row - 1, row, true, { fresh_line })
end

return M
