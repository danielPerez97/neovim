return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		vim.keymap.set("n", "<space>fl", require("telescope.builtin").live_grep, { desc = "Find Text" })
		vim.keymap.set("n", "<space>fb", require("telescope.builtin").builtin, { desc = "Find Builtin" })
		vim.keymap.set("n", "<space>fd", require("telescope.builtin").find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<space>en", function()
			require("telescope.builtin").find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end)
	end,
}
