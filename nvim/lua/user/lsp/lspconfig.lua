local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("lspconfig failed to load!")
    return
end

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions(require('telescope.themes').get_ivy({}))<cr>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua require'telescope.builtin'.lsp_implementations(require('telescope.themes').get_ivy({}))<cr>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua require'telescope.builtin'.lsp_type_definitions(require('telescope.themes').get_ivy({}))<cr>", opts)
    buf_set_keymap("n", "<space>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy({}))<cr>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    buf_set_keymap("n", "<space>ds", "<cmd>lua require'telescope.builtin'.lsp_document_symbols(require('telescope.themes').get_ivy({}))<cr>", opts)
    buf_set_keymap("n", "<space>ws", "<cmd>lua require'telescope.builtin'.lsp_workspace_symbols(require('telescope.themes').get_ivy({}))<cr>", opts)

    -- Get signatures (and _only_ signatures) when in argument lists.
    require "lsp_signature".on_attach({
        doc_lines = 0,
        handler_opts = {
            border = "none"
        },
    })
end


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local flags = {
    debounce_text_changes = 150
}

-- TODO: Fix this (&nbsp) in hover help text.
-- https://www.reddit.com/r/neovim/comments/tx40m2/comment/i3myytc/
-- This strips out &nbsp; and some ending escaped backslashes out of hover
-- strings because the pyright LSP is... odd with how it creates hover strings.
-- local handlers = {
--     ["textDocument/hover"] = vim.lsp.with(
--         function(_, result, ctx, config)
--             vim.notify("entered")
--             if not (result and result.contents) then
--                 vim.notify("0")
--                 return vim.lsp.handlers.hover(_, result, ctx, config)
--             end
--             if type(result.contents) == "string" then
--                 local s = string.gsub(result.contents or "", "&nbsp;", " ")
--                 s = string.gsub(s, [[\\\n]], [[\n]])
--                 result.contents = s
--                 vim.notify("1")
--                 return vim.lsp.handlers.hover(_, result, ctx, config)
--             else
--                 local s = string.gsub((result.contents or {}).value or "", "&nbsp;", " ")
--                 s = string.gsub(s, "\\\n", "\n")
--                 result.contents.value = s
--                 vim.notify("2")
--                 return vim.lsp.handlers.hover(_, result, ctx, config)
--             end
--         end
--     )
-- }

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers {
    -- This is a default handler that will be called for each installed server (also for new servers that are installed during a session)
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            flags = flags,
--            handlers = handlers
        })
    end,

    -- You can also override the default handler for specific servers by providing them as keys, like so:
    ["rust_analyzer"] = function()
        lspconfig["rust_analyzer"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
            flags = flags,
            -- handlers = handlers,
            settings = {
                ["rust_analyzer"] = {
                    cargo = {
                        allFeatures = true,
                    },
                    completion = {
                        postfix = {
                            enable = false,
                        },
                    },
                },
            }
        })
    end,

    ["pyright"] = function()
        lspconfig.pyright.setup({
            capabilities = capabilities,
            flags = flags,
            -- handlers = handlers,
            on_attach = on_attach
        })
    end
}