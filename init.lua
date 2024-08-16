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
vim.api.nvim_set_keymap('n', '½', ':Neotree toggle source=git_status<CR>', { noremap = true, silent = true })
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

--vim.diagnostic.enable(false)

vim.api.nvim_create_autocmd("FileType", {
    pattern = { 'c', 'cpp' },
    callback = function(args)
        vim.keymap.set('n', '<C-a>', ':Ouroboros<CR>', { buffer = args.buf, silent = true })
    end
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local gitsigns = require('gitsigns')
vim.keymap.set('n', '<leader>ga', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>gu', gitsigns.undo_stage_hunk)
vim.keymap.set('n', '<leader>gA', gitsigns.stage_buffer)
vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk)
vim.keymap.set('n', '<leader>gd', gitsigns.diffthis)
vim.keymap.set('v', '<leader>ga', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
vim.keymap.set('n', '<C-k>', gitsigns.prev_hunk)
vim.keymap.set('n', '<C-j>', gitsigns.next_hunk)
