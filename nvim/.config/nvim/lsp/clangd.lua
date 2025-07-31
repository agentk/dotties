---@type vim.lsp.Config
return {
  cmd = { 'clangd', '--background-index' },
  filetypes = {
    'c',
    'cpp',
  },
  root_markers = {
    'compile_commands.json',
    'compile_flags.txt',
  },
  capabilities = require('util').lsp_extend_capabilities(),
}
