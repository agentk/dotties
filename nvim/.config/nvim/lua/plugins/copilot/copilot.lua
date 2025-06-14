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
    'zbirenbaum/copilot-cmp',
    dependencies = {
      'copilot.lua',
    },
    config = true,
  },
  {
    'AndreM222/copilot-lualine',
    dependencies = {
      'nvim-lualine/lualine.nvim',
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
