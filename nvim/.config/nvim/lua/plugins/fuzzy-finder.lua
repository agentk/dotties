return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'echasnovski/mini.icons' },
    opts = {},
    keys = function()
      local function fzf(cmd, opts)
        return function() require('fzf-lua')[cmd](opts) end
      end
      local keys = {
        { '<c-j>', '<c-j>', ft = 'fzf', mode = 't', nowait = true },
        { '<c-k>', '<c-k>', ft = 'fzf', mode = 't', nowait = true },
        -- find
        { '<leader><space>', fzf('buffers', { sort_mru = true, sort_lastused = true }), desc = 'Switch Buffer' },
        { '<leader>fc', fzf('files', { cwd = vim.fn.stdpath('config') }), desc = 'Find Config File' },
        { '<leader>ff', fzf('files'), desc = 'Find Files (Root Dir)' },
        { '<leader>,', fzf('files'), desc = 'Find Files (Root Dir)' },
        { '<leader>fF', fzf('files', { root = false }), desc = 'Find Files (cwd)' },
        { '<leader>fg', fzf('git_files'), desc = 'Find Files (git-files)' },
        { '<leader>fr', fzf('oldfiles'), desc = 'Recent' },
        { '<leader>fR', fzf('oldfiles', { cwd = vim.uv.cwd }), desc = 'Recent (cwd)' },
        -- git
        { '<leader>gc', fzf('git_commits'), desc = 'Commits' },
        { '<leader>gs', fzf('git_status'), desc = 'Status' },
        -- search
        { '<leader>s"', fzf('registers'), desc = 'Registers' },
        { '<leader>sa', fzf('autocmds'), desc = 'Auto Commands' },
        { '<leader>sb', fzf('grep_curbuf'), desc = 'Buffer grep' },
        { '<leader>:', fzf('command_history'), desc = 'Command History' },
        { '<leader>sC', fzf('commands'), desc = 'Commands' },
        { '<leader>sd', fzf('diagnostics_document'), desc = 'Document Diagnostics' },
        { '<leader>sD', fzf('diagnostics_workspace'), desc = 'Workspace Diagnostics' },
        { '<leader>/', fzf('live_grep'), desc = 'Grep (Root Dir)' },
        { '<leader>sG', fzf('live_grep', { root = false }), desc = 'Grep (cwd)' },
        { '<leader>sh', fzf('help_tags'), desc = 'Help Pages' },
        { '<leader>sH', fzf('highlights'), desc = 'Search Highlight Groups' },
        { '<leader>sj', fzf('jumps'), desc = 'Jumplist' },
        { '<leader>sk', fzf('keymaps'), desc = 'Key Maps' },
        { '<leader>sl', fzf('loclist'), desc = 'Location List' },
        { '<leader>sM', fzf('man_pages'), desc = 'Man Pages' },
        { '<leader>sm', fzf('marks'), desc = 'Jump to Mark' },
        { '<leader>sR', fzf('resume'), desc = 'Resume' },
        { '<leader>sq', fzf('quickfix'), desc = 'Quickfix List' },
        { '<leader>sw', fzf('grep_cword'), desc = 'Word (Root Dir)' },
        { '<leader>sW', fzf('grep_cword', { root = false }), desc = 'Word (cwd)' },
        { '<leader>sw', fzf('grep_visual'), mode = 'v', desc = 'Selection (Root Dir)' },
        { '<leader>sW', fzf('grep_visual', { root = false }), mode = 'v', desc = 'Selection (cwd)' },
        { '<leader>uC', fzf('colorschemes'), desc = 'Colorscheme with Preview' },
      }
      return keys
    end,
  },
}
