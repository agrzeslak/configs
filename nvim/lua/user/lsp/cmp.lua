-- TODO: set up CMP such that when a fuction signature is autocompleted, you can tab through the placeholder arguments.
local cmp = require('cmp')
cmp.setup({
    snippet = {
        -- REQUIRED by nvim-cmp. get rid of it once we can
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        -- Tab immediately completes. C-n/C-p to select.
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' })
    },
    sources = cmp.config.sources({
        -- TODO: currently snippets from lsp end up getting prioritized -- stop that!
        { name = 'nvim_lsp' },
    }, {
        { name = 'path' },
    }),
    experimental = {
        ghost_text = true,
    },
})

-- Enable completing paths in :
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    })
})
