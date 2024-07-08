return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      auto_install = true,
      ensure_installed = {
        'c',
        'css',
        'dockerfile',
        'git_config',
        'git_rebase',
        'gitattributes',
        'gitcommit',
        'gitignore',
        'go',
        'html',
        'javascript',
        'json',
        'json5',
        'kotlin',
        'lua',
        'markdown',
        'markdown_inline',
        'objc',
        'query',
        'regex',
        'ruby',
        'rust',
        'swift',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn', -- set to `false` to disable one of the mappings
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm',
        },
      },
    },
    config = function(_, opts)
      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    -- See: https://github.com/jakobwesthoff/nvim-from-scratch/blob/main/lua/plugins/nvim-treesitter-textobjects.lua
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      mode = 'topline',
    },
  },
}
