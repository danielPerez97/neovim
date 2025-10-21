return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "Tokyo Night Night",
					colorscheme = "tokyonight-night",
				},
				{
					name = "Tokyo Night Storm",
					colorscheme = "tokyonight-storm",
				},
				{
					name = "Tokyo Night Moon",
					colorscheme = "tokyonight-moon",
				},
				{
					name = "Tokyo Night Day",
					colorscheme = "tokyonight-day",
				},
			},
			livePreview = true,
		})
	end,
}
