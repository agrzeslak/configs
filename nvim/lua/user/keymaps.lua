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
keymap("n", "<leader>s", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<cr>",
    opts)
keymap("n", "<leader>;", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>", opts)

-- PopUp menu (right-click)
vim.cmd([[
    aunmenu PopUp
    anoremenu PopUp.Go\ To\ Definition          <cmd>lua require'telescope.builtin'.lsp_definitions(require('telescope.themes').get_ivy({}))<cr>
    anoremenu PopUp.Go\ To\ References          <cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy({}))<cr>
    anoremenu PopUp.Go\ To\ Declaration         <cmd>lua vim.lsp.buf.declaration()<CR>
    anoremenu PopUp.Go\ To\ Implementations     <cmd>lua require'telescope.builtin'.lsp_implementations(require('telescope.themes').get_ivy({}))<cr>
    anoremenu PopUp.Go\ To\ Type\ Definitions   <cmd>lua require'telescope.builtin'.lsp_type_definitions(require('telescope.themes').get_ivy({}))<cr>
    anoremenu PopUp.Hover                       <cmd>lua vim.lsp.buf.hover()<CR>
    anoremenu PopUp.Signature\ Help             <cmd>lua vim.lsp.buf.signature_help()<CR>
    anoremenu PopUp.Rename                      <cmd>lua vim.lsp.buf.rename()<CR>  
]])
