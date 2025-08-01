-- https://neovim.io/doc/user/lsp.html#vim.lsp.Config
---@type vim.lsp.Config
return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = {
    '.git',
    '.luacheckrc',
    '.luarc.json',
    '.luarc.jsonc',
    '.stylua.toml',
    'selene.toml',
    'selene.yml',
    'stylua.toml',
  },
  settings = {
    lua = {
      diagnostics = {
        -- disable = { 'missing-parameters', 'missing-fields' },
        disable = { 'missing-fields' },
        globals = { 'vim', 'snacks' },
      },
      hint = {
        enable = true,
        settype = false,
        paramtype = true,
        paramname = 'disable',
        semicolon = 'disable',
        arrayindex = 'disable',
      },
    },
  },
  capabilities = require('util').lsp_extend_capabilities(),
}
