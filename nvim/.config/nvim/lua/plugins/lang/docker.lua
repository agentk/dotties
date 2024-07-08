local util = require('util')
return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = util.ensure_installed({ 'dockerfile' }),
  },
  {
    'mfussenegger/nvim-lint',
    enabled = false,
    opts = { linters_by_ft = { dockerfile = { 'hadolint' } } },
  },
  {
    'neovim/nvim-lspconfig',
    enabled = false,
    opts = {
      servers = {
        dockerls = {},
        docker_compose_language_service = {},
      },
    },
  },
}
