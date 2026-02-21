return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = { "rust", "lua", "vim", "c" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
