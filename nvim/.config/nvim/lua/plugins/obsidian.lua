return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',

    dependencies = {
      'nvim-lua/plenary.nvim',
      -- 'nvim-telescope/telescope.nvim',
    },

    opts = {
      workspaces = {
        {
          name = 'notes',
          path = '~/notes',
        },
      },

      ui = { enable = false },

      daily_notes = {
        folder = '06 - Daily',
        date_format = '%Y-%m-%d',
        default_tags = { 'Daily' },
        template = '99 - Meta/00 - Templates/(TEMPLATE) Daily.md',
      },
    },
    keys = {
      -- Note creation and navigation
      { '<leader>on', '<cmd>ObsidianNew<cr>', desc = '[O]bsidian New' },
      { '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', desc = '[O]bsidian [Q]uick Switch' },
      { '<leader>of', '<cmd>ObsidianFollowLink<cr>', desc = '[O]bsidian [F]ollowLink' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = '[O]bsidian [B]acklinks' },
      { '<leader>ot', '<cmd>ObsidianToday<cr>', desc = '[O]bsidian [T]oday' },
      { '<leader>oy', '<cmd>ObsidianYesterday<cr>', desc = '[O]bsidian [Y]esterday' },
      { '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = '[O]bsidian [O]pen' },

      -- Search and links
      { '<leader>os', '<cmd>ObsidianSearch<cr>', desc = '[O]bsidian [S]earch' },
      { '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = '[O]bsidian [L]inks' },
      { '<leader>ol', '<cmd>ObsidianLinkNew<cr>', mode = 'v', desc = '[O]bsidian [L]inkNew' },

      -- Templates and utilities
      { '<leader>ot', '<cmd>ObsidianTemplate<cr>', desc = '[O]bsidian [T]emplate' },
      { '<leader>or', '<cmd>ObsidianRename<cr>', desc = '[O]bsidian [R]ename' },
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = '[O]bsidian [P]asteImg' },
      { '<leader>ox', '<cmd>ObsidianExtractNote<cr>', desc = '[O]bsidian E[x]tractNote' },
      { '<leader>ox', '<cmd>ObsidianExtractNote<cr>', mode = 'v', desc = '[O]bsidian [E]xtractNote' },

      -- Workspace
      { '<leader>ow', '<cmd>ObsidianWorkspace<cr>', desc = '[O]bsidian Workspace' },
    },
    config = function(_, opts)
      require('obsidian').setup(opts)
    end,
  },
}
