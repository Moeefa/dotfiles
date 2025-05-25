local linter_root_markers = {
  biomejs = { 'biome.json', 'biome.jsonc' },
  eslint_d = {
    'eslint.config.js',
    'eslint.config.mjs',
    'eslint.config.cjs',
    'eslint.config.ts',
    'eslint.config.mts',
    'eslint.config.cts',
    -- deprecated
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json',
  },
}

return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      -- lua = { 'luacheck' },
    },
  },
  config = function(_, opts)
    local lint = require 'lint'

    local lint_augroup = vim.api.nvim_create_augroup('Lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'InsertLeave', 'TextChanged' }, {
      group = lint_augroup,
      callback = function()
        local names = opts.linters_by_ft[vim.bo.filetype]
        if not names then
          return
        end

        for _, name in pairs(names) do
          if linter_root_markers[name] == nil or next(vim.fs.find(linter_root_markers[name], { upward = true })) then
            lint.try_lint(name)
          end
        end
      end,
    })

    vim.keymap.set('n', '<leader>l', function()
      lint.try_lint()
    end, { desc = 'Lint current buffer' })
  end,
}
