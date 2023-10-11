local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>/", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy({}))<cr>",
    opts)
keymap("n", "<leader>;", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>k", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
keymap("n", "<leader>t", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
keymap("n", "<leader>s",
    "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>S",
    "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>'", "<cmd>lua require'telescope.builtin'.resume(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>g", "<cmd>lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>j", "<cmd>lua require'telescope.builtin'.jumplist(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>*", "<cmd>lua require'telescope.builtin'.grep_string(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "<leader>b", ":Gitsigns blame_line<cr>", opts)
keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions(require('telescope.themes').get_ivy({}))<cr>",
    opts)
keymap("n", "gi", "<cmd>lua require'telescope.builtin'.lsp_implementations(require('telescope.themes').get_ivy({}))<cr>"
    , opts)
keymap("n", "gy",
    "<cmd>lua require'telescope.builtin'.lsp_type_definitions(require('telescope.themes').get_ivy({}))<cr>", opts)
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

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
