local M = {}

function M.ensure_installed(packages)
  return M.table_append('ensure_installed', packages)
end

function M.table_append(key, list)
  return function(_, opts)
    opts[key] = vim.list_extend(opts[key] or {}, list)
    return opts
  end
end

function M.lsp_extend_capabilities(extra)
  local blink = require('blink.cmp')
  -- local print = require('snacks').debug.inspect
  -- print(vim.lsp.protocol.make_client_capabilities())
  -- print(blink.get_lsp_capabilities())
  return vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities(), {
    fileoperations = {
      didrename = true,
      willrename = true,
    },
  }, extra or {})
end

function M.fuzzy_root(buf_nr, pattern)
  local buffer = vim.api.nvim_buf_get_name(buf_nr)
  local bufpath = vim.fn.fnamemodify(buffer, ':p:h')
  local paths = vim.fs.find(function(name, _)
    return name:match(pattern) ~= nil
  end, {
    upward = true,
    path = bufpath,
  })
  return vim.fs.dirname(paths[1])
end

return M
