local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("Treesitter configs could not be loaded!")
    return
end

configs.setup {
    ensure_installed = "all", -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- Install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- `false` will disable the whole extension
        disable = { "" }, -- List of languages that will be disabled
        additional_vim_regex_highlighting = true,
    },
    -- Disable placing cursor at appropriate indent level for specific languages (the yaml one is supposedly not great)
    indent = { enabled = true, disable = { "yaml" } },
    -- JoosepAlviste/nvim-ts-context-commentstring
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
