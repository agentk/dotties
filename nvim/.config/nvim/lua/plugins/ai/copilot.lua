return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    build = ':Copilot auth',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = false,
      },
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'giuxtaposition/blink-cmp-copilot',
    },
    opts = {
      sources = {
        default = { 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
    },
    opts_extend = { 'sources.default' },
  },
  {
    'AndreM222/copilot-lualine',
    enabled = false,
    dependencies = {
      'nvim-lualine/lualine.nvim',
    },
  },
}
