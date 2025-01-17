if vim.fn.executable('cppman') == 0 then
    return {}
end

return {
  'v1nh1shungry/cppman.nvim',
  dependencies = 'nvim-telescope/telescope.nvim',
  opts = {},
}
