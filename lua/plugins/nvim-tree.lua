return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        require("nvim-tree").setup({
            git = {enable = false},
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")
                local opts = function(desc)
                    return {
                        desc = "nvim-tree: " .. desc,
                        buffer = bufnr,
                        noremap = true,
                        silent = true,
                        nowait = true
                    }
                end

                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.del("n", "<CR>", {buffer = bufnr})

                vim.keymap.set("n", "l", function()
                    api.node.open.edit()
                    vim.schedule(function()
                        vim.api.nvim_exec_autocmds("BufRead", {
                            buffer = vim.api.nvim_get_current_buf()
                        })
                    end)
                end, opts("Open"))

                vim.keymap.set("n", "h", api.node.navigate.parent_close,
                               opts("Close"))

                vim.api.nvim_create_autocmd("CursorMoved", {
                    buffer = bufnr,
                    callback = function()
                        local node = api.tree.get_node_under_cursor()
                        if node and node.type == "file" then
                            api.node.open.preview()
                        end
                    end
                })
            end
        })

        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",
                       {silent = true, nowait = true})
    end
}
