return {
    "stevearc/conform.nvim",
    event = {"BufReadPre", "BufNewFile"},
    keys = {
        {
            "<leader>ff",
            function()
                require("conform").format({
                    lsp_fallback = false,
                    async = false,
                    timeout_ms = 500
                })
            end,
            mode = {"n", "v"},
            desc = "Format buffer"
        }
    },
    opts = {
        formatters = {
            ["lua-format"] = {
                args = {
                    "-c", vim.fn.expand(
                        "~/.config/nvim/formatters/lua-format/lua-format"),
                    "-"
                }
            }
        },
        formatters_by_ft = {
          lua = { "lua-format" }
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = false
        }
    }
}
