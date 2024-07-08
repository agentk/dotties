local set = vim.opt_local

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.foldmethod = 'expr'
set.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
set.foldcolumn = '0'
set.foldtext = ''
set.foldlevel = 2
set.foldlevelstart = 1
set.foldnestmax = 6
