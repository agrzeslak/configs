local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>s", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>;", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>", opts)
