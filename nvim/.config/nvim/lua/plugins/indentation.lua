return {
  { -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    init = function()
      vim.cmd([[ let g:sleuth_dts_heuristics = 0 ]])
    end,
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        char = '┊',
        tab_char = '╎',
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          'lspinfo',
          'packer',
          'checkhealth',
          'help',
          'man',
          'dashboard',
          '',
        },
      },
    },
  },
}
