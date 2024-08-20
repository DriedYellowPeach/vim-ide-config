-- local status_cmp_ok, cmp = pcall(require, "cmp")
-- if not status_cmp_ok then
-- 	return
-- end

lvim.builtin.cmp.mapping["<Tab>"] = nil
lvim.builtin.cmp.mapping["<S-Tab>"] = nil
-- set mapping CR for cmp
-- lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm({
-- 	select = false,
-- 	behavior = cmp.ConfirmBehavior.Replace,
-- })
lvim.builtin.cmp.cmdline.enable = true
-- allow duplicate entries on lsp completion, because there may be method or variables of the same name
lvim.builtin.cmp.formatting.duplicates.nvim_lsp = 1
-- lvim.builtin.cmp.experimental.ghost_text = {
-- 	hl_group = "CmpGhostText",
-- }

lvim.builtin.cmp.formatting.fields = { "abbr", "kind", "menu" }
lvim.builtin.cmp.formatting.format = function(entry, vim_item)
	local max_width = lvim.builtin.cmp.formatting.max_width
	if max_width ~= 0 and #vim_item.abbr > max_width then
		vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. lvim.icons.ui.Ellipsis
	end
	if lvim.use_icons then
		local icon = lvim.builtin.cmp.formatting.kind_icons[vim_item.kind] or ""
		vim_item.kind = icon .. " " .. (vim_item.kind or "")

		if entry.source.name == "copilot" then
			vim_item.kind = lvim.icons.git.Octoface .. " " .. "Copilot"
			vim_item.kind_hl_group = "CmpItemKindCopilot"
		end

		if entry.source.name == "cmp_tabnine" then
			vim_item.kind = lvim.icons.misc.Robot
			vim_item.kind_hl_group = "CmpItemKindTabnine"
		end

		if entry.source.name == "crates" then
			vim_item.kind = lvim.icons.misc.Package
			vim_item.kind_hl_group = "CmpItemKindCrate"
		end

		if entry.source.name == "lab.quick_data" then
			vim_item.kind = lvim.icons.misc.CircuitBoard
			vim_item.kind_hl_group = "CmpItemKindConstant"
		end

		if entry.source.name == "emoji" then
			vim_item.kind = lvim.icons.misc.Smiley
			vim_item.kind_hl_group = "CmpItemKindEmoji"
		end
	end
	vim_item.menu = lvim.builtin.cmp.formatting.source_names[entry.source.name]
	vim_item.dup = lvim.builtin.cmp.formatting.duplicates[entry.source.name]
		or lvim.builtin.cmp.formatting.duplicates_default
	return vim_item
end
