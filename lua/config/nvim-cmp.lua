local cmp = require'cmp'
cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = "fuzzy_buffer" },
        { name = 'path' },
        --{ name = 'nvim_lsp' },
    })
})

--require'lspconfig'.clangd.setup{
--}

local compare = require('cmp.config.compare')

cmp.setup {
    sorting = {
        priority_weight = 2,
        comparators = {
            require('cmp_fuzzy_buffer.compare'),
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
        }
    },
    sources = {
        {
            name = "buffer",
            option = {
                keyword_pattern = [[\k\+]],
            }
        }
    },
}
