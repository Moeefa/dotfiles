return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        close_if_last_window = true,
        enable_git_status = true,
        enable_diagnostics = true,
        window = { position = 'left', width = 30 },
        filesystem = { filtered_items = { hide_dotfiles = false, hide_gitignored = true } },
      }
      vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Abrir Neo-tree' })
    end,
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        styles = { comments = { italic = false } },
      }
      vim.cmd.colorscheme 'slate'
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      delay = 0,
      icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ', Down = '<Down> ', Left = '<Left> ', Right = '<Right> ',
          C = '<C-…> ', M = '<M-…> ', D = '<D-…> ', S = '<S-…> ', CR = '<CR> ',
          Esc = '<Esc> ', ScrollWheelDown = '<ScrollWheelDown> ', ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ', BS = '<BS> ', Space = '<Space> ', Tab = '<Tab> ',
          F1 = '<F1>', F2 = '<F2>', F3 = '<F3>', F4 = '<F4>', F5 = '<F5>',
          F6 = '<F6>', F7 = '<F7>', F8 = '<F8>', F9 = '<F9>', F10 = '<F10>',
          F11 = '<F11>', F12 = '<F12>',
        },
      },
      spec = {
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      statusline.section_location = function() return '%2l:%-2v' end
    end,
  },
}

