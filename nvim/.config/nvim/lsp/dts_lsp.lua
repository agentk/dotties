--[[
`dts-lsp` is an LSP for Devicetree files built on top of tree-sitter-devicetree grammar.

Install `dts-lsp` from https://github.com/igor-prusov/dts-lsp and add it to path

`dts-lsp` doesn't require any configuration.

More about Devicetree:
https://www.devicetree.org/
https://docs.zephyrproject.org/latest/build/dts/index.html
--]]

---@type vim.lsp.Config
return {
  name = 'dts_lsp',
  cmd = { 'dts-lsp' },
  filetypes = { 'dts', 'dtsi', 'overlay' },
  root_markers = { '.git' },
  settings = {},
}
