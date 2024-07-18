local hlts = {}
for i = 1, 6 do
	table.insert(hlts, "Headline" .. i)
end

require("headlines").setup({
	markdown = {
		headline_highlights = hlts,
		bullets = {},
	},
})
