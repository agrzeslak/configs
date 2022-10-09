local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

require("null-ls").setup({
  sources = {
    code_actions.eslint,
    diagnostics.eslint,
    diagnostics.flake8,
    diagnostics.markdownlint,
    formatting.black,
    formatting.prettier,
  },
})