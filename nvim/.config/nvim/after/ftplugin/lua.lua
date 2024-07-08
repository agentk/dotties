local set = vim.opt_local

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.foldmethod = 'expr'
set.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
set.foldcolumn = '0'
set.foldtext = ''
set.foldlevel = 99
set.foldlevelstart = 99
set.foldnestmax = 6
