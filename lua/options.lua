local o = vim.opt

o.autowrite = true
o.clipboard = "unnamedplus"
o.confirm = true
o.cursorline = true
o.number = true
o.expandtab = true
o.incsearch = true
o.tabstop = 4
o.shiftwidth = 4
o.showmode = false
o.smartcase = true -- Don't ignore case with capitals
o.smartindent = true -- Insert indents automatically
o.wrap = true
o.scrolloff = 5 -- Lines of context
o.relativenumber = false -- Relative line numbers
o.termguicolors = true -- True color support
o.ignorecase = true -- Ignore case
o.inccommand = "nosplit" -- preview incremental substitute
o.list = true -- Show some invisible characters (tabs...
o.sidescrolloff = 8 -- Columns of context
o.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
o.mouse = "" -- Disable mouse
o.undolevels = 10000

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
