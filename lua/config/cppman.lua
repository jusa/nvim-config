if vim.fn.executable('cppman') == 0 then
    return
end

local cppman = require('cppman')

cppman.setup {
    win = {
        split = "above",
    },
    picker = "telescope",
    index_db_path = vim.fn.expand('$HOME/.local/lib/python3.10/site-packages/cppman/lib/index.db'),
}

-- keymaps
vim.keymap.set('n', '<A-j>', function() cppman.search() end)
vim.keymap.set('n', '<A-k>', function() cppman.open(vim.fn.expand('<cword>')) end)
vim.keymap.set('v', '<A-k>', function() cppman.open(vim.fn.expand('<cword>')) end)
