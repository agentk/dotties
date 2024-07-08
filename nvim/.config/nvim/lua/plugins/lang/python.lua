return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = { ensure_installed = { 'ninja', 'rst' } },
  },
  {
    'neovim/nvim-lspconfig',
    enabled = false,
    opts = {
      servers = {
        pyright = {},
        ruff = {
          cmd_env = { RUFF_TRACE = 'messages' },
          init_options = {
            settings = { logLevel = 'error' },
          },
          -- keys = {
          --   {
          --     '<leader>co',
          --     vim.lsp.action.source.organizeImports,
          --     desc = 'Organize Imports',
          --   },
          -- },
        },
      },
      setup = {
        ruff = function()
          vim.lsp.on_attach(function(client, _)
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end, 'ruff')
        end,
      },
    },
  },
  {
    'nvim-neotest/neotest',
    enabled = false,
    dependencies = {
      'nvim-neotest/neotest-python',
    },
    opts = {
      adapters = {
        ['neotest-python'] = {
          -- Here you can specify the settings for the adapter, i.e.
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    enabled = false,
    dependencies = {
      'mfussenegger/nvim-dap-python',
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
      },
      config = function()
        require('dap-python').setup('uv')
      end,
    },
  },
  {
    'linux-cultist/venv-selector.nvim',
    enabled = false,
    branch = 'regexp', -- Use this branch for the new version
    cmd = 'VenvSelect',
    -- enabled = function()
    --   return vim.has('telescope.nvim')
    -- end,
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    --  Call config for python files and load the cached venv automatically
    ft = 'python',
    keys = { { '<leader>cv', '<cmd>:VenvSelect<cr>', desc = 'Select VirtualEnv', ft = 'python' } },
  },
}
