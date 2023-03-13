local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
	return
end

lvim.builtin.cmp.mapping["<Tab>"] = nil
lvim.builtin.cmp.mapping["<S-Tab>"] = nil
-- set mapping CR for cmp
lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm({
	select = false,
	behavior = cmp.ConfirmBehavior.Replace,
})
