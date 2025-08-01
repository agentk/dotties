---@diagnostic disable: missing-fields
return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    ---@module 'which-key.nvim'
    ---@type wk.Opts
    opts = {
      preset = 'helix',
      spec = {
        -- Document existing key chains
        { '<leader>a', group = 'Avante' },
        { '<leader>c', group = 'Code' },
        { '<leader>d', group = 'Document' },
        { '<leader>f', group = 'Find' },
        { '<leader>g', group = 'Git' },
        { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
        { '<leader>m', group = 'Markdown' },
        { '<leader>o', group = 'Obsidian' },
        { '<leader>r', group = 'Rename' },
        { '<leader>s', group = 'Search' },
        { '<leader>t', group = 'Toggle' },
        { '<leader>u', group = 'UI' },
        { '<leader>w', group = 'Workspace' },
        { '<leader>x', group = 'Trouble' },

        -- LSP builtins
        { 'K', desc = 'Display symbol documentation' },
        { 'gra', desc = 'Code action', icon = '󰁨' },
        { 'gri', desc = 'List implementations', icon = '' },
        { 'grn', desc = 'Rename all references', icon = '' },
        { 'gO', desc = 'List all document symbols', icon = '' },
        { '<C-s>', desc = 'Display signature help', mode = { 'i', 's' } },
      },
    },
    keys = {
      { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer Local Keymaps (which-key)' },
    },
  },
}
