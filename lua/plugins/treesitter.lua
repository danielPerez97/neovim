return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "rust", "lua", "vim" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
