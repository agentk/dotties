return {
  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      linters_by_ft = {
        bash = { 'bash' },
        dockerfile = { 'hadolint' },
        javascript = { 'eslint' },
        json = { 'jsonlint' },
        nix = { 'nix' },
        ruby = { 'rubocop' },
        swift = { 'swiftlint' },
        text = { 'vale' },
        yaml = { 'yamllint' },
        zsh = { 'zsh' },
      },
    },
    config = function(_, opts)
      local lint = require('lint')
      lint.linters_by_ft = opts.linters_by_ft

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function() require('lint').try_lint() end,
      })
    end,
  },
}
