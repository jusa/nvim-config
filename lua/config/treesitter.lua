local languages = {
    "c",
    "cpp",
    "java",
    "javascript",
    "kotlin",
    "lua",
    "markdown",
    "python",
    "vimdoc",
}

local treesitter = require('nvim-treesitter')
treesitter.setup()
treesitter.install(languages)

vim.api.nvim_create_autocmd('FileType', {
    pattern = languages,
    callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
