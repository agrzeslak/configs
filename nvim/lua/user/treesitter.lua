local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    vim.notify("Treesitter configs could not be loaded!")
    return
end

-- TODO: parts from tjdevries treesitter.lua because I saw the nice TS motions
--       he has, but most don't work yet.
local swap_next, swap_prev = (function()
    local swap_objects = {
        p = "@parameter.inner",
        f = "@function.outer",
        e = "@element",
    }

    local n, p = {}, {}
    for key, obj in pairs(swap_objects) do
        n[string.format("<M-Space><M-%s>", key)] = obj
        p[string.format("<M-BS><M-%s>", key)] = obj
    end

    return n, p
end)()

configs.setup {
    autotag = {
        enable = true,        -- nvim-ts-autotag plugin
    },
    ensure_installed = "all", -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false,     -- Install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" },  -- List of parsers to ignore installing
    highlight = {
        enable = true,        -- `false` will disable the whole extension
        disable = { "" },     -- List of languages that will be disabled
        additional_vim_regex_highlighting = false,
    },
    -- Disable placing cursor at appropriate indent level for specific languages (the yaml one is supposedly not great)
    indent = { enabled = true, disable = { "yaml" } },
    -- JoosepAlviste/nvim-ts-context-commentstring
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    playground = {
        enable = true,
    }
}

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring/issues/82
local status_ok, ts_context_commentstring = pcall(require, "ts_context_commentstring")
if not status_ok then
    vim.notify("ts_context_commentstring could not be loaded!")
    return
end
ts_context_commentstring.setup {
    enable_autocmd = false
}
