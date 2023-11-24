return {

  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = {
      use_diagnostic_signs = true,
      position = "bottom",
    },
    keys = {
      {
        "<leader>xx",
        function()
          local tb = require("trouble")
          tb.toggle()
        end,
      },

      {
        "<leader>xw",
        function()
          local tb = require("trouble")
          tb.toggle("workspace_diagnostics")
        end,
      },

      {
        "<leader>xd",
        function()
          local tb = require("trouble")
          tb.toggle("document_diagnostics")
        end,
      },

      {
        "<leader>xq",
        function()
          local tb = require("trouble")
          tb.toggle("quickfix")
        end,
      },

      {
        "<leader>xl",
        function()
          local tb = require("trouble")
          tb.toggle("loclist")
        end,
      },
      {
        "gR",
        function()
          local tb = require("trouble")
          tb.toggle("lsp_references")
        end,
      },
    },
  },
}
