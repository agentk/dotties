return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.icons',
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = { lsp = { enabled = true } },
      file_types = { 'markdown', 'Avante' },
      latex = { enabled = false },
    },
    ft = { 'markdown', 'Avante' },
    keys = {
      { '<leader>mr', '<cmd>RenderMarkdown toggle<cr>', desc = '[M]arkdown [R]ender' },
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = {
      'MarkdownPreviewToggle',
      'MarkdownPreview',
      'MarkdownPreviewStop',
    },
    ft = { 'markdown' },
    build = 'cd app && npx --yes yarn install',
    init = function() vim.g.mkdp_filetypes = { 'markdown' } end,
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', desc = '[M]arkdown [P]review' },
    },
  },
}
