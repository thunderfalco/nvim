return {
  -- comment
  {
    "numToStr/Comment.nvim",
    opts = {},
    lazy = false,
  },
  -- field, function structure like idea's f12
  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({})
    end,
  },
  -- scroll smoothly
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
}
