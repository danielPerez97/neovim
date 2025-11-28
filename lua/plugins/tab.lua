return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({})

		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
		vim.keymap.set("n", "<leader>b1", ":BufferLineGoToBuffer 1<CR>", { silent = true })
		vim.keymap.set("n", "<leader>b2", ":BufferLineGoToBuffer 2<CR>", { silent = true })
		vim.keymap.set("n", "<leader>b3", ":BufferLineGoToBuffer 3<CR>", { silent = true })
		vim.keymap.set("n", "<leader>b4", ":BufferLineGoToBuffer 4<CR>", { silent = true })
		vim.keymap.set("n", "<leader>b5", ":BufferLineGoToBuffer 5<CR>", { silent = true })
		vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true })
	end,
}
