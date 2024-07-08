vim.lsp.enable({
  'bashls',
  'clangd',
  'cssls',
  'docker_compose_language_service',
  'dockerls',
  'dts_lsp',
  'gh_actions_ls',
  'html',
  'jsonls',
  'lua_ls',
  'sourcekit',
  'ts_ls',
  'vale_ls',
  'yamlls',
})

vim.diagnostic.config({
  -- virtual_lines = true,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
})

-- Auto Commands

-- These keymaps are the defaults in Neovim v0.10
-- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
-- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
-- vim.keymap.set('n', '<C-w>d', '<cmd>lua vim.diagnostic.open_float()<cr>')
-- vim.keymap.set('n', '<C-w><C-d>', '<cmd>lua vim.diagnostic.open_float()<cr>')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local bufmap = function(mode, rhs, lhs, desc) vim.keymap.set(mode, rhs, lhs, { buffer = event.buf, desc = desc }) end

    -- These keymaps are the defaults in Neovim v0.11
    -- bufmap('n', 'K', vim.lsp.buf.hover, 'Display symbol documentation')
    -- bufmap('n', 'gO', vim.lsp.buf.document_symbol, 'List all document symbols')
    -- bufmap('n', 'gra', vim.lsp.buf.code_action, 'Code action')
    -- bufmap('n', 'gri', vim.lsp.buf.implementation, 'List implementations')
    -- bufmap('n', 'grn', vim.lsp.buf.rename, 'Rename all references')
    -- bufmap('n', 'grr', vim.lsp.buf.references, 'List references')
    -- bufmap({ 'i', 's' }, '<C-s>', vim.lsp.buf.signature_help, 'Display signature help')

    bufmap('n', 'gd', vim.lsp.buf.definition, 'Goto definition')
    bufmap('n', 'gD', vim.lsp.buf.declaration, 'Goto declaration')
    bufmap('n', 'gO', require('fzf-lua').lsp_document_symbols, 'Goto Symbol')
    bufmap('n', 'gra', require('fzf-lua').lsp_code_actions, 'Code action')
    bufmap('n', 'gri', require('fzf-lua').lsp_implementations, 'List implementations')
    bufmap('n', 'grr', require('fzf-lua').lsp_references, 'List references')
    bufmap('n', 'grt', require('fzf-lua').lsp_typedefs, 'List type definitions')
    bufmap('n', '<leader>ss', require('fzf-lua').lsp_document_symbols, 'Goto Symbol')
    bufmap('n', '<leader>sS', require('fzf-lua').lsp_live_workspace_symbols, 'Goto Symbol (Workspace)')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then return end

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = 'lsp-highlight', buffer = event2.buf })
        end,
      })
    end

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      bufmap('n', '<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })) end, 'Toggle Inlay Hints')
    end

    if client:supports_method(vim.lsp.protocol.Methods.textDocument_codeLens, event.buf) then
      vim.lsp.codelens.refresh()
      vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
        buffer = event.buf,
        callback = vim.lsp.codelens.refresh,
      })
      bufmap('n', '<leader>tH', vim.lsp.codelens.run, 'Toggle Code Lens')
    end
  end,
})

-- Extra Commands

local function restart_lsp(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  for _, client in ipairs(clients) do
    vim.lsp.stop_client(client.id)
  end

  vim.defer_fn(function() vim.cmd('edit') end, 100)
end

vim.api.nvim_create_user_command('LspRestart', function() restart_lsp() end, {})

local function lsp_status()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if #clients == 0 then
    print('󰅚 No LSP clients attached')
    return
  end

  print('󰒋 LSP Status for buffer ' .. bufnr .. ':')
  print('─────────────────────────────────')

  for i, client in ipairs(clients) do
    print(string.format('󰌘 Client %d: %s (ID: %d)', i, client.name, client.id))
    print('  Root: ' .. (client.config.root_dir or 'N/A'))
    ---@diagnostic disable-next-line: undefined-field
    print('  Filetypes: ' .. table.concat(client.config.filetypes or {}, ', '))

    -- Check capabilities
    local caps = client.server_capabilities or {}
    local features = {}
    if caps.completionProvider then table.insert(features, 'completion') end
    if caps.hoverProvider then table.insert(features, 'hover') end
    if caps.definitionProvider then table.insert(features, 'definition') end
    if caps.referencesProvider then table.insert(features, 'references') end
    if caps.renameProvider then table.insert(features, 'rename') end
    if caps.codeActionProvider then table.insert(features, 'code_action') end
    if caps.documentFormattingProvider then table.insert(features, 'formatting') end

    print('  Features: ' .. table.concat(features, ', '))
    print('')
  end
end

vim.api.nvim_create_user_command('LspStatus', lsp_status, { desc = 'Show detailed LSP status' })

local function check_lsp_capabilities()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  if #clients == 0 then
    print('No LSP clients attached')
    return
  end

  for _, client in ipairs(clients) do
    print('Capabilities for ' .. client.name .. ':')
    local caps = client.server_capabilities or {}

    local capability_list = {
      { 'Completion', caps.completionProvider },
      { 'Hover', caps.hoverProvider },
      { 'Signature Help', caps.signatureHelpProvider },
      { 'Go to Definition', caps.definitionProvider },
      { 'Go to Declaration', caps.declarationProvider },
      { 'Go to Implementation', caps.implementationProvider },
      { 'Go to Type Definition', caps.typeDefinitionProvider },
      { 'Find References', caps.referencesProvider },
      { 'Document Highlight', caps.documentHighlightProvider },
      { 'Document Symbol', caps.documentSymbolProvider },
      { 'Workspace Symbol', caps.workspaceSymbolProvider },
      { 'Code Action', caps.codeActionProvider },
      { 'Code Lens', caps.codeLensProvider },
      { 'Document Formatting', caps.documentFormattingProvider },
      { 'Document Range Formatting', caps.documentRangeFormattingProvider },
      { 'Rename', caps.renameProvider },
      { 'Folding Range', caps.foldingRangeProvider },
      { 'Selection Range', caps.selectionRangeProvider },
    }

    for _, cap in ipairs(capability_list) do
      local status = cap[2] and '✓' or '✗'
      print(string.format('  %s %s', status, cap[1]))
    end
    print('')
  end
end

vim.api.nvim_create_user_command('LspCapabilities', check_lsp_capabilities, { desc = 'Show LSP capabilities' })

local function lsp_diagnostics_info()
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr)

  local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

  for _, diagnostic in ipairs(diagnostics) do
    local severity = vim.diagnostic.severity[diagnostic.severity]
    counts[severity] = counts[severity] + 1
  end

  print('󰒡 Diagnostics for current buffer:')
  print('  Errors: ' .. counts.ERROR)
  print('  Warnings: ' .. counts.WARN)
  print('  Info: ' .. counts.INFO)
  print('  Hints: ' .. counts.HINT)
  print('  Total: ' .. #diagnostics)
end

vim.api.nvim_create_user_command('LspDiagnostics', lsp_diagnostics_info, { desc = 'Show LSP diagnostics count' })

local function lsp_info()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  print('═══════════════════════════════════')
  print('           LSP INFORMATION          ')
  print('═══════════════════════════════════')
  print('')

  -- Basic info
  print('󰈙 Language client log: ' .. vim.lsp.get_log_path())
  print('󰈔 Detected filetype: ' .. vim.bo.filetype)
  print('󰈮 Buffer: ' .. bufnr)
  print('󰈔 Root directory: ' .. (vim.fn.getcwd() or 'N/A'))
  print('')

  if #clients == 0 then
    print('󰅚 No LSP clients attached to buffer ' .. bufnr)
    print('')
    print('Possible reasons:')
    print('  • No language server installed for ' .. vim.bo.filetype)
    print('  • Language server not configured')
    print('  • Not in a project root directory')
    print('  • File type not recognized')
    return
  end

  print('󰒋 LSP clients attached to buffer ' .. bufnr .. ':')
  print('─────────────────────────────────')

  for i, client in ipairs(clients) do
    print(string.format('󰌘 Client %d: %s', i, client.name))
    print('  ID: ' .. client.id)
    print('  Root dir: ' .. (client.config.root_dir or 'Not set'))
    ---@diagnostic disable-next-line: param-type-mismatch
    print('  Command: ' .. table.concat(client.config.cmd or {}, ' '))
    ---@diagnostic disable-next-line: undefined-field
    print('  Filetypes: ' .. table.concat(client.config.filetypes or {}, ', '))

    -- Server status
    if client:is_stopped() then
      print('  Status: 󰅚 Stopped')
    else
      print('  Status: 󰄬 Running')
    end

    -- Workspace folders
    if client.workspace_folders and #client.workspace_folders > 0 then
      print('  Workspace folders:')
      for _, folder in ipairs(client.workspace_folders) do
        print('    • ' .. folder.name)
      end
    end

    -- Attached buffers count
    local attached_buffers = {}
    for buf, _ in pairs(client.attached_buffers or {}) do
      table.insert(attached_buffers, buf)
    end
    print('  Attached buffers: ' .. #attached_buffers)

    -- Key capabilities
    local caps = client.server_capabilities or {}
    local key_features = {}
    if caps.completionProvider then table.insert(key_features, 'completion') end
    if caps.hoverProvider then table.insert(key_features, 'hover') end
    if caps.definitionProvider then table.insert(key_features, 'definition') end
    if caps.documentFormattingProvider then table.insert(key_features, 'formatting') end
    if caps.codeActionProvider then table.insert(key_features, 'code_action') end

    if #key_features > 0 then print('  Key features: ' .. table.concat(key_features, ', ')) end

    print('')
  end

  -- Diagnostics summary
  local diagnostics = vim.diagnostic.get(bufnr)
  if #diagnostics > 0 then
    print('󰒡 Diagnostics Summary:')
    local counts = { ERROR = 0, WARN = 0, INFO = 0, HINT = 0 }

    for _, diagnostic in ipairs(diagnostics) do
      local severity = vim.diagnostic.severity[diagnostic.severity]
      counts[severity] = counts[severity] + 1
    end

    print('  󰅚 Errors: ' .. counts.ERROR)
    print('  󰀪 Warnings: ' .. counts.WARN)
    print('  󰋽 Info: ' .. counts.INFO)
    print('  󰌶 Hints: ' .. counts.HINT)
    print('  Total: ' .. #diagnostics)
  else
    print('󰄬 No diagnostics')
  end

  print('')
  print('Use :LspLog to view detailed logs')
  print('Use :LspCapabilities for full capability list')
end

-- Create command
vim.api.nvim_create_user_command('LspInfo', lsp_info, { desc = 'Show comprehensive LSP information' })
