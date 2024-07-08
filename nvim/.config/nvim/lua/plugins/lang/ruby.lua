local util = require('util')

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = util.ensure_installed({ 'ruby' }),
  },
  {
    'neovim/nvim-lspconfig',
    enabled = false,
    ---@class PluginLspOpts
    opts = {
      servers = {
        ruby_lsp = {},
        rubocop = { enabled = true },
      },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    enabled = false,
    opts = util.ensure_installed({
      'erb-formatter',
      'erb-lint',
    }),
  },
  {
    'mfussenegger/nvim-dap',
    enabled = false,
    dependencies = {
      'suketa/nvim-dap-ruby',
      config = function()
        require('dap-ruby').setup()
      end,
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        ruby = { 'rubocop' },
        eruby = { 'erb_format' },
      },
    },
  },
  {
    'nvim-neotest/neotest',
    enabled = false,
    dependencies = {
      'olimorris/neotest-rspec',
    },
    opts = {
      adapters = {
        ['neotest-rspec'] = {
          rspec_cmd = 'bundle exec rspec',
        },
      },
    },
  },
}
