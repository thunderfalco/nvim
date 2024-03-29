return {

  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "smartpde/telescope-recent-files",
      "nvim-telescope/telescope-fzf-native.nvim",
      "stevearc/aerial.nvim",
      build = "make",
      config = function()
        local telescope = require("telescope")
        telescope.load_extension("recent_files")
        telescope.load_extension("fzf")
        telescope.load_extension("aerial")
      end,
    },

    keys = {
      {
        "<leader>fa",
        function()
          local telescope = require("telescope")
          telescope.extensions.aerial.aerial()
        end,
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>ff",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
      },
      {
        "<leader>fg",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
      },
      {
        "<leader>fh",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
      },
      {
        "<leader>fd",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
      },
      {
        "<leader>ft",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
      },
      {
        "<leader>fc",
        function()
          local telescope = require("telescope")
          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            groupd = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = {
              height = 40,
            },
          })
        end,
      },
      {
        "<leader><leader>",
        function()
          local telescope = require("telescope")
          telescope.extensions.recent_files.pick()
        end,
      },
    },

    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.action
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "vertical",
        layout_config = { prompt_position = "bottom" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
    end,
  },

  {
    "RRethy/vim-illuminate",
    event = "LazyFile",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },
}
