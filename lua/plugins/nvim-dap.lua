return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"wojciech-kulik/xcodebuild.nvim",
	},
	config = function()
		local dap = require("dap")
		local xcodebuild = require("xcodebuild.integrations.dap")

		-- Adapters
		dap.adapters.lldb = {
			type = "executable",
			command = vim.fn.exepath("lldb-dap"),
			name = "lldb",
		}

		-- Configurations
		dap.configurations.rust = {
			{
				name = "Launch binary",
				type = "lldb",
				request = "launch",
				program = function()
					local metadata = vim.fn.json_decode(vim.fn.system("cargo metadata --no-deps --format-version 1"))
					local name = metadata.packages[1].name:gsub("-", "_")
					local result = vim.fn.system("cargo build")
					if vim.v.shell_error ~= 0 then
						print("cargo build failed:\n" .. result)
						return nil
					end
					return vim.fn.getcwd() .. "/target/debug/" .. name
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
		-- Keymaps
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue / Launch" })
		vim.keymap.set("n", "<leader>dx", dap.terminate, { desc = "Terminate Debugger" })
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<leader>B", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log message: "))
		end, { desc = "Toggle Message Breakpoint" })
	end,
}
