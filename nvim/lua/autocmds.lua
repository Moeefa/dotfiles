vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    for _, group in ipairs { 'Normal', 'NormalNC', 'SignColumn', 'VertSplit' } do
      vim.cmd(string.format('highlight %s ctermbg=none guibg=none', group))
    end
  end,
})
