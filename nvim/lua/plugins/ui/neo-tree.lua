return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    -- { '3rd/image.nvim', opts = {} },
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      window = { position = 'left', width = 30 },
      filesystem = { filtered_items = { hide_dotfiles = false, hide_gitignored = false } },
      default_component_configs = {
        icon = {
          folder_empty = '',
          folder_empty_open = '',
          folder_closed = '',
          folder_open = '',
          symlink = '',
          symlink_open = '',
        },
      },
    }
    vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Abrir Neo-tree' })
  end,
}
