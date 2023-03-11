lvim.builtin.which_key.mappings.s.u = { "<cmd>Telescope resume<Cr>", "Telescope Resume" }
-- lvim.builtin.which_key.mappings.w.name = "window"
-- lvim.builtin.which_key.mappings.w.h = {"<cmd>split<Cr>", "window hori split"}
-- lvim.builtin.which_key.mappings.w.v = {"<cmd>vsplit<Cr>", "window vertical split"}
lvim.builtin.which_key.mappings.w = {
		name = "window",
		h = { "<cmd>split<Cr>", "window hori split" },
		v = { "<cmd>vsplit<Cr>", "window vertical split" },
}
