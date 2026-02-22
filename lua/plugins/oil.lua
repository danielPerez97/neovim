return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {{"nvim-mini/mini.icons", opts = {}}},
    lazy = false,
    config = function()
        require("oil").setup({
          float = {
            padding = 2, 
            border = "rounded"
          },
          keymaps = {
            ["l"] = "actions.select",
            ["."] = { "actions.toggle_hidden", mode = "n" },
          },
        })

        vim.keymap.set("n", "<leader>e", require("oil").toggle_float,
                       {desc = "Open oil floating window."})
    end
}
