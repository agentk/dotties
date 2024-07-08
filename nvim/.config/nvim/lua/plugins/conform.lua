return {
  {
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>cf',
        function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
        desc = 'Code Format (Conform)',
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
        if filetype == 'markdown' and vim.startswith(bufname, vim.fn.expand('~/notes/')) then disable_markdown = false end
        local disable_filetypes = { c = true, cpp = true, markdown = disable_markdown }
        local format = 'none'
        if disable_filetypes[filetype] then format = 'fallback' end
        return {
          timeout_ms = 500,
          lsp_format = format,
        }
      end,
      formatters_by_ft = {
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        json = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier', 'markdownlint' },
        ruby = { 'rubocop' },
        swift = { 'swiftlint', 'swiftformat' },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        zsh = { 'shellcheck', 'shfmt' },
      },
    },
  },
}
