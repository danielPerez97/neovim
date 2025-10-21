return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			persist_mode = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
			vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

		local Terminal = require("toggleterm.terminal").Terminal

		local horizontal_term = Terminal:new({
			direction = "horizontal",
			hidden = true,
		})

		function _HORIZONTAL_TERM_TOGGLE()
			horizontal_term:toggle()
		end

		local vertical_term = Terminal:new({
			direction = "vertical",
			hidden = true,
		})

		function _VERTICAL_TERM_TOGGLE()
			vertical_term:toggle()
		end

		local lazygit = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "double",
			},
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		})

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end

		local node = Terminal:new({ cmd = "node", hidden = true })

		function _NODE_TOGGLE()
			node:toggle()
		end

		local python = Terminal:new({ cmd = "python", hidden = true })

		function _PYTHON_TOGGLE()
			python:toggle()
		end

		vim.keymap.set(
			"n",
			"<leader>h",
			"<cmd>lua _HORIZONTAL_TERM_TOGGLE()<CR>",
			{ desc = "Toggle Horizontal Terminal" }
		)
		vim.keymap.set("n", "<leader>v", "<cmd>lua _VERTICAL_TERM_TOGGLE()<CR>", { desc = "Toggle Vertical Terminal" })
		vim.keymap.set("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", { desc = "Toggle Lazygit" })
		vim.keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", { desc = "Toggle Node" })
		vim.keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", { desc = "Toggle Python" })
	end,
}
