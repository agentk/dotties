return {
  {
    'olimorris/codecompanion.nvim',
    cmd = { 'CodeCompanion', 'CodeCompanionChat', 'CodeCompanionActions' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'ravitemer/codecompanion-history.nvim', -- Save and load conversation history
      'nvim-treesitter/nvim-treesitter',
      {
        'ravitemer/mcphub.nvim', -- Manage MCP servers
        cmd = 'MCPHub',
        build = 'npm install -g mcp-hub@latest',
        config = true,
      },
      {
        'Davidyz/VectorCode', -- Index and search code in your repositories
        version = '*',
        build = 'uv tool install vectorcode',
        dependencies = { 'nvim-lua/plenary.nvim' },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { 'markdown', 'codecompanion' },
      },
      {
        'echasnovski/mini.diff',
        config = function()
          local diff = require('mini.diff')
          diff.setup({
            -- Disabled by default
            source = diff.gen_source.none(),
          })
        end,
      },
      {
        'HakonHarnes/img-clip.nvim',
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = '[Image]($FILE_PATH)',
              use_absolute_path = true,
            },
          },
        },
      },
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'ollama',
          tools = {
            ['cmd_runner'] = {
              opts = {
                requires_approval = false,
              },
            },
          },
        },
        inline = {
          adapter = 'ollama',
        },
        cmd = {
          adapter = 'ollama',
        },
      },
      adapters = {
        opts = {
          show_defaults = false,
          show_model_choices = true,
        },
        -- External base adapters
        copilot = function()
          return require('codecompanion.adapters').extend('copilot', {})
        end,
        openai = function()
          return require('codecompanion.adapters').extend('openai', {
            opts = {
              stream = true,
            },
            env = {
              api_key = 'cmd:sops-read OPENAI_API_KEY',
            },
            schema = {
              model = {
                default = 'gpt-4.1',
              },
            },
          })
        end,
        anthropic = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = {
              api_key = 'cmd:sops-read ANTHROPIC_API_KEY',
            },
          })
        end,
        deepseek = function()
          return require('codecompanion.adapters').extend('deepseek', {
            env = {
              api_key = 'cmd:sops-read DEEPSEEK_API_KEY',
            },
          })
        end,
        -- External custom adapters
        genai = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            env = {
              url = 'https://api.studio.genai.example',
              api_key = 'cmd:sops-read GENAI_API_KEY',
            },
            schema = {
              model = {
                default = 'aipe-bedrock-claude-3-7-sonnet',
              },
            },
          })
        end,
        -- Locally hosted adapters
        ollama = function()
          return require('codecompanion.adapters').extend('ollama', {
            schema = {
              model = {
                default = 'qwen3:32b',
              },
            },
            num_ctx = {
              default = 20000,
            },
          })
        end,
        lmstudio = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            name = 'lmstudio',
            env = {
              url = 'http://127.0.0.1:8012',
            },
          })
        end,
      },
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = 'gh',
            save_chat_keymap = 'sc',
            auto_save = false,
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = 'snacks',
            enable_logging = false,
            dir_to_save = vim.fn.stdpath('data') .. '/codecompanion-history',
          },
        },
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
        vectorcode = {
          opts = {
            add_tool = true,
          },
        },
      },
      display = {
        action_palette = {
          provider = 'default',
          opts = {
            show_default_actions = true, -- Show the default actions in the action palette?
            show_default_prompt_library = true, -- Show the default prompt library in the action palette?
          },
        },
        chat = {
          -- show_settings = true,
          -- show_references = true,
          -- show_header_separator = false,
        },
        diff = {
          provider = 'mini_diff',
        },
      },
      prompt_library = {
        ['Test workflow'] = {
          strategy = 'workflow',
          description = 'Use a workflow to test the plugin',
          opts = {
            index = 4,
          },
          prompts = {
            {
              {
                role = 'user',
                content = 'Generate a Python class for managing a book library with methods for adding, removing, and searching books',
                opts = {
                  auto_submit = false,
                },
              },
            },
            {
              {
                role = 'user',
                content = 'Write unit tests for the library class you just created',
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = 'user',
                content = 'Create a TypeScript interface for a complex e-commerce shopping cart system',
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = 'user',
                content = 'Write a recursive algorithm to balance a binary search tree in Java',
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = 'user',
                content = 'Generate a comprehensive regex pattern to validate email addresses with explanations',
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = 'user',
                content = 'Create a Rust struct and implementation for a thread-safe message queue',
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = 'user',
                content = 'Write a GitHub Actions workflow file for CI/CD with multiple stages',
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = 'user',
                content = 'Create SQL queries for a complex database schema with joins across 4 tables',
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = 'user',
                content = 'Write a Lua configuration for Neovim with custom keybindings and plugins',
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = 'user',
                content = 'Generate documentation in JSDoc format for a complex JavaScript API client',
                opts = {
                  auto_submit = true,
                },
              },
            },
          },
        },
      },
    },
    keys = {
      {
        '<C-a>',
        '<cmd>CodeCompanionActions<CR>',
        desc = 'Open the action palette',
        mode = { 'n', 'v' },
      },
      {
        '<Leader>a',
        '<cmd>CodeCompanionChat Toggle<CR>',
        desc = 'Toggle a chat buffer',
        mode = { 'n', 'v' },
      },
      {
        '<LocalLeader>a',
        '<cmd>CodeCompanionChat Add<CR>',
        desc = 'Add code to a chat buffer',
        mode = { 'v' },
      },
    },
  },
}
