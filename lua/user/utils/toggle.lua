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

return M
