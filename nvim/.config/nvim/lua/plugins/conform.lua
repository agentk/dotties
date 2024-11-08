return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format({ async = true, lsp_fallback = true })
        end,
        mode = '',
        desc = '[C]ode [F]ormat (Conform)',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        go = { 'gofumpt', 'goimports-reviser', 'golines' },
        lua = { 'stylua' },
        swift = { 'swiftlint', 'swiftformat' },
        zsh = { 'shellcheck', 'shfmt' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
