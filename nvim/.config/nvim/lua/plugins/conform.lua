return {
  {
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
    ---@module "conform"
    ---@type conform.setupOpts
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local filetype = vim.bo[bufnr].filetype
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        local disable_markdown = true
        if filetype == 'markdown' and vim.startswith(bufname, vim.fn.expand('~/notes/')) then
          disable_markdown = false
        end
        local disable_filetypes = { c = true, cpp = true, markdown = disable_markdown }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[filetype],
        }
      end,
      formatters_by_ft = {
        go = { 'gofumpt', 'goimports-reviser', 'golines' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier', 'markdownlint' },
        swift = { 'swiftlint', 'swiftformat' },
        typescript = { 'prettier' },
        zsh = { 'shellcheck', 'shfmt' },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
