return {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
        "folke/snacks.nvim", 
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-tree.lua", 
        "stevearc/oil.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    config = function() require("xcodebuild").setup({}) end
}
