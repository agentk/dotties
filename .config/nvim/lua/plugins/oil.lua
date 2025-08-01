return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = {
      { 'echasnovski/mini.icons', opts = {} },
    },
    keys = {
      { '-', '<cmd>Oil<cr>', desc = 'Oil' },
    },
    opts = {
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
        is_always_hidden = function(name, _)
          if name:match('^.DS_Store$') then return true end
          return false
        end,
      },
    },
  },
}
