local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

keymap("i", "jk", "<ESC>", opts)

keymap("n", "<Leader>lt", [[:LspRestart<CR>]], opts)
