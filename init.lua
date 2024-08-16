require("config.lazy")
require("config.nvim-cmp")
require("config.treesitter")
require("config.gitsigns")
require("options")
vim.cmd "colorscheme twilight256"
vim.cmd "highlight Normal guibg=black guifg=white"
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<Tab>', 'gt', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<S-Tab>', 'gT', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<F8>', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '§', ':Neotree toggle reveal=true<CR>', { noremap = true, silent = true })
--nnoremap <C-n> :cn<CR>
--nnoremap <C-p> :cp<CR>

-- telescope keymaps
local tele = require('telescope.builtin')
vim.keymap.set('n', '<C-f>', tele.find_files, {})
vim.keymap.set('n', '<C-g>', tele.grep_string, {})
vim.keymap.set('n', '<leader>ff', tele.find_files, {})
vim.keymap.set('n', '<leader>fg', tele.live_grep, {})
vim.keymap.set('n', '<leader>fb', tele.buffers, {})
vim.keymap.set('n', '<leader>fh', tele.help_tags, {})

-- vim-grep
vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*.gitopenbuffer",
    callback = function(args)
        vim.keymap.set('n', 't', '^<C-w>gF', { buffer = args.buf, silent = true })
        vim.keymap.set('n', 'j', '<Down>w^', { buffer = args.buf, silent = true })
        vim.keymap.set('n', 'k', '^<Backspace><Backspace>^', { buffer = args.buf, silent = true })
        vim.keymap.set('n', 'q', ':q!<CR>', { buffer = args.buf, silent = true })
        vim.keymap.set('n', '<ENTER>', '^gF', { buffer = args.buf, silent = true })
    end,
})

function ToggleNeoTreeFullScreen()
    local neo = require('neo-tree')
    local view = require('neo-tree.view')
    if view.win_config and view.is_visible() then
        if view.win_config.width == vim.o.columns then
            view.win_config.width = neo_tree.config.window.width or 30
        else
            view.win_config.width = vim.o.columns
        end
    end
    neo.show()
end

vim.api.nvim_set_keymap('n', '½', '<cmd>lua ToggleNeoTreeFullScreen()<CR>', {noremap = true, silent = true})

--vim.diagnostic.enable(false)

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'c', 'cpp' },
    callback = function(args)
        vim.keymap.set('n', '<C-a>', ':Ouroboros<CR>', { buffer = args.buf, silent = true })
    end
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
