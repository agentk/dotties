return {
  { -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    init = function() vim.cmd([[ let g:sleuth_dts_heuristics = 0 ]]) end,
  },
}
