return {
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    enabled = false,
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', config = true },
    },
    opts = function()
      local opts = {
        inlay_hints = { enabled = true, exclude = { 'vue' } },
        codelens = { enabled = false },
        servers = {
          sourcekit = {
            capabilities = {
              workspace = {
                didChangeWatchedFiles = {
                  dynamicRegistration = true,
                },
              },
            },
          },
        },
        setup = {},
      }
      return opts
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          --  To jump back, press <C-t>.
          map('gd', require('fzf-lua').lsp_definitions, 'Goto Definition')
          map('gD', vim.lsp.buf.declaration, 'Goto Declaration')
          map('gr', require('fzf-lua').lsp_references, 'Goto References')
          map('gI', require('fzf-lua').lsp_implementations, 'Goto Implementation')
          map('<leader>D', require('fzf-lua').lsp_typedefs, 'Type Definition')
          map('<leader>ds', require('fzf-lua').lsp_document_symbols, 'Document Symbols')
          map('<leader>ws', require('fzf-lua').lsp_workspace_symbols, 'Workspace Symbols')
          map('<leader>cr', vim.lsp.buf.rename, 'Rename')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
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
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = 'kickstart-lsp-highlight', buffer = event2.buf })
              end,
            })
          end

          -- The following autocommand is used to enable inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, 'Toggle Inlay Hints')
          end
          if client and client.server_capabilities.codeLensProvider and vim.lsp.codelens then
            vim.lsp.codelens.refresh()
            vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'InsertLeave' }, {
              buffer = event.buf,
              callback = vim.lsp.codelens.refresh,
            })
            map('<leader>cl', vim.lsp.codelens.run, 'Code Lens')
          end
        end,
      })

      ----------------------------------------------------------------------------------
      ----------------------------------------------------------------------------------
      -- This is a more advanced setup that allows you to configure LSP servers
      ----------------------------------------------------------------------------------
      ----------------------------------------------------------------------------------

      -- setup autoformat
      -- LazyVim.format.register(LazyVim.lsp.formatter())

      -- setup keymaps
      -- LazyVim.lsp.on_attach(function(client, buffer)
      --   require('lazyvim.plugins.lsp.keymaps').on_attach(client, buffer)
      -- end)

      -- LazyVim.lsp.setup()
      -- LazyVim.lsp.on_dynamic_capability(require('lazyvim.plugins.lsp.keymaps').on_attach)

      -- if type(opts.diagnostics.virtual_text) == 'table' and opts.diagnostics.virtual_text.prefix == 'icons' then
      --   opts.diagnostics.virtual_text.prefix = vim.fn.has('nvim-0.10.0') == 0 and '●'
      --     or function(diagnostic)
      --       local icons = LazyVim.config.icons.diagnostics
      --       for d, icon in pairs(icons) do
      --         if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
      --           return icon
      --         end
      --       end
      --     end
      -- end

      -- vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local servers = opts.servers
      -- local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local capabilities =
        -- vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), cmp_nvim_lsp.default_capabilities(), opts.capabilities or {})
        vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), opts.capabilities or {})

      local function setup(server)
        local server_opts = vim.tbl_deep_extend('force', { capabilities = vim.deepcopy(capabilities) }, servers[server] or {})
        if server_opts.enabled == false then
          return
        end

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup['*'] then
          if opts.setup['*'](server, server_opts) then
            return
          end
        end
        require('lspconfig')[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local mlsp = require('mason-lspconfig')
      local all_mslp_servers = require('mason-lspconfig.mappings').get_mason_map().package_to_lspconfig

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.enabled ~= false then
            -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
            if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
              setup(server)
            else
              ensure_installed[#ensure_installed + 1] = server
              vim.list_extend(ensure_installed, server_opts.ensure_installed or {})
            end
          end
        end
      end

      -- Tools installer will ensure automatic updates of tools
      require('mason-tool-installer').setup({ ensure_installed = ensure_installed, auto_update = true })
      mlsp.setup({
        ensure_installed = ensure_installed,
        handlers = { setup },
        automatic_enable = true,
      })
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    enabled = false,
    config = function(_, opts)
      require('mason-tool-installer').setup(opts)
    end,
  },
}
