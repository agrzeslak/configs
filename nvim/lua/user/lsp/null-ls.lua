local null_ls = require("null-ls")
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

require("null-ls").setup({
    sources = {
        code_actions.eslint,
        diagnostics.eslint,
        diagnostics.flake8,
        diagnostics.markdownlint.with({ extra_args = { "--rules ~MD024" }}),
        -- Black string formatting is currently experimental and not enabled by default.
        formatting.black.with({ extra_args = { "--experimental-string-processing" } }),
        formatting.clang_format,
        -- Prettier does not always wrap text in markdown files as new line characters sometimes have a special meaning.
        formatting.prettier.with({ extra_args = { "--prose-wrap", "always" } }),
        formatting.xmlformat,
    },
})
