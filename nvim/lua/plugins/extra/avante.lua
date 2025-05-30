return {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  opts = {
    provider = 'copilot',
    copilot = {
      model = 'claude-sonnet-4',
      endpoint = 'https://api.githubcopilot.com',
      allow_insecure = false,
      timeout = 10 * 60 * 1000,
      temperature = 0,
      max_completion_tokens = 1000000,
      reasoning_effort = 'high',
    },
  },
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'echasnovski/mini.pick',
    'nvim-telescope/telescope.nvim',
    'hrsh7th/nvim-cmp',
    'ibhagwan/fzf-lua',
    'nvim-tree/nvim-web-devicons',
    'zbirenbaum/copilot.lua',
    {
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        default = { embed_image_as_base64 = false, prompt_for_file_name = false, drag_and_drop = { insert_mode = true }, use_absolute_path = true },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = { file_types = { 'markdown', 'Avante' } },
      ft = { 'markdown', 'Avante' },
    },
  },
  --[[  config = function()
    -- Checa se o avante está carregado
    local ok, avante = pcall(require, 'avante')
    if ok then
      -- Tenta limpar autocmds problemáticos
      vim.api.nvim_clear_autocmds {
        event = 'WinEnter',
        -- Se o avante criou um grupo, ideal passar group = "avante"
        -- mas como não temos certeza, limpamos geral.
      }
    end
  end, ]]
}
