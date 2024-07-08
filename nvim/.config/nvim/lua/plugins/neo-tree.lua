return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    version = '*',
    lazy = false, -- neo-tree will lazily load itself
    dependencies = {
      'nvim-lua/plenary.nvim',
      'echasnovski/mini.icons',
      'MunifTanjim/nui.nvim',
    },
    cmd = 'Neotree',
    keys = {
      { '\\', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
    },
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      filesystem = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
          },
        },
        filtered_items = {
          visible = true,
          never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
            '.DS_Store',
            'thumbs.db',
          },
        },
      },
    },
  },
}
