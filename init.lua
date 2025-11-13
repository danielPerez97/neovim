vim.opt.termguicolors = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.timeoutlen = 300

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format file" })

require("config.lazy")
require("bufferline").setup({})
require("lazy").setup({
	{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
})

-- LSP's
vim.lsp.enable({ "clangd", "rust-analyzer" })
