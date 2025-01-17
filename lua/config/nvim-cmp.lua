local cmp = require'cmp'
local fuzzy_compare = require('cmp.config.compare')

cmp.setup.filetype(
    { "c",
      "cpp",
      "dart",
      "bash",
      "sh",
      "lua",
      "python",
      "java",
      "javascript" }, {
    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    },
    sources = cmp.config.sources({
        { name = "fuzzy_buffer" },
        { name = 'path' },
        --{ name = 'nvim_lsp' },
    }),
    sorting = {
        priority_weight = 2,
        comparators = {
            require('cmp_fuzzy_buffer.compare'),
            fuzzy_compare.offset,
            fuzzy_compare.exact,
            fuzzy_compare.score,
            fuzzy_compare.recently_used,
            fuzzy_compare.kind,
            fuzzy_compare.sort_text,
            fuzzy_compare.length,
            fuzzy_compare.order,
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
})

--require'lspconfig'.clangd.setup{
--}
