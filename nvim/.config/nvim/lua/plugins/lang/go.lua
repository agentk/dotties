local util = require('util')
return {
  {
    'neovim/nvim-lspconfig',
    mason = false,
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = { unusedparams = true },
              completeUnimported = true,
              staticcheck = true,
              -- useplaceholders = true,
            },
          },
        },
      },
    },
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    enabled = false,
    opts = util.ensure_installed({
      'gofumpt',
      'goimports-reviser',
      'golines',
    }),
  },
}
