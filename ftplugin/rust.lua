local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

-- m means magic
local mappings = {
	m = {
		name = "Rust 󱡃",
		-- only setkeymaps for runnables and debuggables
		-- cause there are already code lens for run/debug the line under cursor
		r = { "<cmd>RustLsp runnables<Cr>", "Runnables" },
		d = { "<cmd>RustLsp debuggables<Cr>", "Debuggables" },
		e = { "<cmd>RustLsp expandMacro<Cr>", "Expand Macro" },
		m = {
			name = "Move Item",
			j = {
				"<cmd>RustLsp moveItem down<Cr>",
				"down",
			},
			k = {
				"<cmd>RustLsp moveItem up<Cr>",
				"up",
			},
		},
		["?"] = {
			"<cmd>RustLsp explainError<Cr>",
			"explain error",
		},
		-- todo
		-- parentModule
		-- joinLines
		-- syntaxTree
		-- logFile

		-- r = {
		-- 	function()
		-- 		-- set the position to center using vim.ui.input
		-- 		vim.ui.input({
		-- 			prompt = "Enter arguments: ",
		-- 			-- position = "center",
		-- 		}, function(input)
		-- 			print("Input: ", input)
		-- 		end)
		-- 	end,
		-- 	"Runnables",
		-- },
	},
}

which_key.register(mappings, opts)
