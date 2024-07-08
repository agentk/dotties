return {
  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      local which_key = require('which-key')
      which_key.setup()

      -- Document existing key chains
      require('which-key').add({
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>f', group = '[F]ind' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>m', group = '[M]arkdown' },
        { '<leader>o', group = '[O]bsidian' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>x', group = '[X]trouble' },
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 e
