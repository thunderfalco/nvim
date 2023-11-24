return {
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({})
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
}
