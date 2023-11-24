return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No infromation available",
        },
        opts = {
          skip = true,
        },
      })
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
      background_colour = "#000000",
    },
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      local transparent = require("transparent")
      transparent.setup({
        extra_groups = {
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NormalFloat",
        },
      })
    end,
  },
}
