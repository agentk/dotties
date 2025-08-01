return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        { name = 'notes', path = '~/notes' },
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
      { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'Obsidian New' },
      { '<leader>oq', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Obsidian Quick Switch' },
      { '<leader>of', '<cmd>ObsidianFollowLink<cr>', desc = 'Obsidian FollowLink' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Obsidian Backlinks' },
      { '<leader>ot', '<cmd>ObsidianToday<cr>', desc = 'Obsidian Today' },
      { '<leader>oy', '<cmd>ObsidianYesterday<cr>', desc = 'Obsidian Yesterday' },
      { '<leader>oo', '<cmd>ObsidianOpen<cr>', desc = 'Obsidian Open' },
      -- Search and links
      { '<leader>os', '<cmd>ObsidianSearch<cr>', desc = 'Obsidian Search' },
      { '<leader>ol', '<cmd>ObsidianLinks<cr>', desc = 'Obsidian Links' },
      { '<leader>ol', '<cmd>ObsidianLinkNew<cr>', mode = 'v', desc = 'Obsidian LinkNew' },
      -- Templates and utilities
      { '<leader>ot', '<cmd>ObsidianTemplate<cr>', desc = 'Obsidian Template' },
      { '<leader>or', '<cmd>ObsidianRename<cr>', desc = 'Obsidian Rename' },
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Obsidian PasteImg' },
      { '<leader>ox', '<cmd>ObsidianExtractNote<cr>', desc = 'Obsidian ExtractNote' },
      { '<leader>ox', '<cmd>ObsidianExtractNote<cr>', mode = 'v', desc = 'Obsidian ExtractNote' },
      -- Workspace
      { '<leader>ow', '<cmd>ObsidianWorkspace<cr>', desc = 'Obsidian Workspace' },
    },
  },
}
