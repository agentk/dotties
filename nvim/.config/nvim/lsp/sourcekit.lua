--[[

Language server for Swift and C/C++/Objective-C.

https://github.com/swiftlang/sourcekit-lsp

--]]

---@type vim.lsp.Config
return {
  cmd = { 'sourcekit-lsp' },
  filetypes = { 'swift', 'objc', 'objcpp', 'c', 'cpp' },
  root_dir = function(bufnr, on_dir)
    on_dir(
      vim.fs.root(bufnr, { 'buildServer.json' })
        or require('util').fuzzy_root(bufnr, '%.*(xcodeproj|xcworkspace)$')
        or vim.fs.root(bufnr, { 'compile_commands.json', 'Package.swift' })
        or vim.fs.root(bufnr, { '.git' })
    )
  end,
  get_language_id = function(_, ftype)
    local t = { objc = 'objective-c', objcpp = 'objective-cpp' }
    return t[ftype] or ftype
  end,
  capabilities = require('util').lsp_extend_capabilities({
    textDocument = {
      diagnostic = {
        dynamicRegistration = true,
        relatedDocumentSupport = true,
      },
    },
  }),
}
