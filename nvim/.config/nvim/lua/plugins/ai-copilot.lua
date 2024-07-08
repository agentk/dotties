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
    config = function(_, opts)
      require('copilot').setup(opts)
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = {
      'copilot.lua',
    },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
  {
    'AndreM222/copilot-lualine',
    enabled = false,
    dependencies = {
      'nvim-lualine/lualine.nvim',
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
