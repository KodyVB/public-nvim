local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("i", "<C-a>", "<Plug>luasnip-next-choice", {})
keymap("s", "<C-a>", "<Plug>luasnip-next-choice", {})
