lvim.builtin.which_key.setup.ignore_missing = false

lvim.builtin.which_key.mappings.s.u = { "<cmd>Telescope resume<Cr>", "Telescope Resume" }

lvim.builtin.which_key.mappings.v = {
	name = "window",
	h = { "<cmd>split<Cr>", "window horizontal split" },
	v = { "<cmd>vsplit<Cr>", "window vertical split" },
}

lvim.builtin.which_key.setup.plugins.presets = {
	operators = {
		d = true,
		v = true,
	}, -- adds help for operators like d, y, ...
	motions = true, -- adds help for motions
	text_objects = true, -- help for text objects triggered after entering an operator
	windows = true, -- default bindings on <c-w>
	nav = true, -- misc bindings to work with windows
	z = true, -- bindings for folds, spelling and others prefixed with z
	g = true, -- bindings for prefixed with g
}

lvim.builtin.which_key.mappings.l.t = {
	function()
		require("user.utils.toggle").inlay_hints()
	end,
	"Toggle Inlay Hints",
}
-- ---@param config {args?:string[]|fun():string[]?}
-- local function get_args(config)
-- 	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
-- 	config = vim.deepcopy(config)
-- 	---@cast args string[]
-- 	config.args = function()
-- 		local new_args = vim.fn.input("Run with args: ", table.concat(args, " ")) --[[@as string]]
-- 		return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
-- 	end
-- 	return config
-- end

-- lvim.builtin.which_key.mappings.d.s = {
-- 	{
-- 		function()
-- 			require("dap").continue({ before = get_args })
-- 		end,
-- 		"Start",
-- 	},
-- }
