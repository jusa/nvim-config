local opt = vim.opt

opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.confirm = true
opt.cursorline = true
opt.number = true
opt.expandtab = true
opt.incsearch = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.showmode = false
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.wrap = true
opt.scrolloff = 5 -- Lines of context
opt.relativenumber = false -- Relative line numbers
opt.termguicolors = true -- True color support
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.list = true -- Show some invisible characters (tabs...
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.mouse = "" -- Disable mouse
opt.undolevels = 10000
opt.undofile = true
local undodir = vim.fn.expand("~/.local/share/nvim/undodir//")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p");
end
opt.undodir = undodir

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
