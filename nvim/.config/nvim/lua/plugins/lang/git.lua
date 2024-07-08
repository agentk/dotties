local util = require('util')
return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = util.ensure_installed({
      'git_config',
      'gitcommit',
      'git_rebase',
      'gitignore',
      'gitattributes',
    }),
  },
}
