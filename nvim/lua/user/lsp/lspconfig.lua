local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("lspconfig failed to load!")
    return
end

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = { noremap = true, silent = true }

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

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
        local root_files = {
            -- Default fm https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/server_configurations/pyright.lua
            "pyproject.toml",
            "setup.py",
            "setup.cfg",
            "requirements.txt",
            "Pipfile",
            "pyrightconfig.json",
            -- Django root not being detected, let's add .git
            ".git",
        }
        lspconfig.pyright.setup({
            capabilities = capabilities,
            flags = flags,
            -- handlers = handlers,
            on_attach = on_attach,
            -- unpack is apparently replaced by table.unpack due to deprecation, nvim doesn't seem to have it
            root_dir = lspconfig.util.root_pattern(unpack(root_files)),
        })
    end
}
