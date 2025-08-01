local util = require('util')
return {
  {
    'yetone/avante.nvim',
    enabled = true,
    event = 'VeryLazy',
    version = false, -- Never set this value to "*"! Never!
    build = 'make',
    dev = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'ibhagwan/fzf-lua',
      'echasnovski/mini.icons',
      'zbirenbaum/copilot.lua',
      'MeanderingProgrammer/render-markdown.nvim',
    },
    opts = function()
      local models = {}
      if util.enterprise then
        models = require('plugins/ai/models/enterprise')
      else
        models = require('plugins/ai/models/personal')
      end
      local opts = {
        providers = {
          ollama = { model = 'qwen2.5-coder:32b', is_env_set = function() return true end },
          copilot = { hide_in_model_selector = true },
          vertex = { hide_in_model_selector = true },
          vertex_claude = { hide_in_model_selector = true },
        },
        behaviour = {
          auto_apply_diff_after_generation = true,
          support_paste_from_clipboard = true,
          auto_approve_tool_permissions = true,
        },
        selector = {
          provider = 'snacks',
          provider_opts = {},
          exclude_auto_select = {}, -- List of items to exclude from auto selection
        },
        input = {
          provider = 'snacks',
          provider_opts = {
            -- Additional snacks.input options
            title = 'Avante Input',
            icon = ' ',
          },
        },
        web_search_engine = {
          provider = 'tavily', -- tavily, serpapi, searchapi, google, kagi, brave, or searxng
          providers = {
            tavily = {
              api_key_name = 'cmd:sops-read TAVILY_API_KEY',
            },
          },
        },
        -- system_prompt as function ensures LLM always has latest MCP server state
        -- This is evaluated for every message, even in existing chats
        system_prompt = function()
          local hub = require('mcphub').get_hub_instance()
          return hub and hub:get_active_servers_prompt() or ''
        end,
        -- Using function prevents requiring mcphub before it's loaded
        custom_tools = function()
          return {
            require('mcphub.extensions.avante').mcp_tool(),
          }
        end,
        disabled_tools = {
          -- Disable tools that are provided centrally by mcphub
          'list_files',
          'search_files',
          'read_file',
          'create_file',
          'rename_file',
          'delete_file',
          'create_dir',
          'rename_dir',
          'delete_dir',
          'bash',
        },
      }
      return vim.tbl_deep_extend('force', models, opts)
    end,
    config = function(_, opts)
      require('avante').setup(opts)

      local p_grammar_correction = 'Correct the text to standard English, but keep any code blocks inside intact.'
      local p_keywords = 'Extract the main keywords from the following text'
      local p_code_readability_analysis = [[
      You must identify any readability issues in the code snippet.
      Some readability issues to consider:
      - Unclear naming
      - Unclear purpose
      - Redundant or obvious comments
      - Lack of comments
      - Long or complex one liners
      - Too much nesting
      - Long variable names
      - Inconsistent naming and code style.
      - Code repetition
      You may identify additional problems. The user submits a small section of code from a larger file.
      Only list lines with readability issues, in the format <line_num>|<issue and proposed solution>
      If there's no issues with code respond with only: <OK>
    ]]
      local p_optimize_code = 'Optimize the following code'
      local p_summarize = 'Summarize the following text'
      local p_translate = 'Translate this into Chinese, but keep any code blocks inside intact'
      local p_explain_code = 'Explain the following code'
      local p_complete_code = 'Complete the following codes written in ' .. vim.bo.filetype
      local p_add_docstring = 'Add docstring to the following codes'
      local p_fix_bugs = 'Fix the bugs inside the following codes if any'
      local p_add_tests = 'Implement tests for the following code'

      local function ask(prompt)
        return function() require('avante.api').ask({ question = prompt }) end
      end

      -- prefil edit window with common scenarios to avoid repeating query and submit immediately
      local function edit(prompt)
        return function()
          require('avante.api').edit()
          local code_bufnr = vim.api.nvim_get_current_buf()
          local code_winid = vim.api.nvim_get_current_win()
          if code_bufnr == nil or code_winid == nil then return end
          vim.api.nvim_buf_set_lines(code_bufnr, 0, -1, false, { prompt })
          -- Optionally set the cursor position to the end of the input
          vim.api.nvim_win_set_cursor(code_winid, { 1, #prompt + 1 })
          -- Simulate Ctrl+S keypress to submit
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-s>', true, true, true), 'v', true)
        end
      end

      require('which-key').add({
        {
          mode = { 'n', 'v' },
          { '<leader>amb', ask(p_fix_bugs), desc = 'Fix Bugs (ask)' },
          { '<leader>amc', ask(p_complete_code), desc = 'Complete Code (ask)' },
          { '<leader>amd', ask(p_add_docstring), desc = 'Docstring (ask)' },
          { '<leader>amg', ask(p_grammar_correction), desc = 'Grammar Correction (ask)' },
          { '<leader>amk', ask(p_keywords), desc = 'Keywords (ask)' },
          { '<leader>aml', ask(p_code_readability_analysis), desc = 'Code Readability Analysis (ask)' },
          { '<leader>amm', ask(p_summarize), desc = 'Summarize text (ask)' },
          { '<leader>amn', ask(p_translate), desc = 'Translate text (ask)' },
          { '<leader>amo', ask(p_optimize_code), desc = 'Optimize Code (ask)' },
          { '<leader>amu', ask(p_add_tests), desc = 'Add Tests (ask)' },
          { '<leader>amx', ask(p_explain_code), desc = 'Explain Code (ask)' },
        },
        {
          mode = { 'v' },
          { '<leader>amB', edit(p_fix_bugs), desc = 'Fix Bugs (edit)' },
          { '<leader>amC', edit(p_complete_code), desc = 'Complete Code (edit)' },
          { '<leader>amD', edit(p_add_docstring), desc = 'Docstring (edit)' },
          { '<leader>amG', edit(p_grammar_correction), desc = 'Grammar Correction' },
          { '<leader>amK', edit(p_keywords), desc = 'Keywords' },
          { '<leader>amO', edit(p_optimize_code), desc = 'Optimize Code (edit)' },
          { '<leader>amU', edit(p_add_tests), desc = 'Add Tests (edit)' },
        },
      })
    end,
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'Kaiser-Yang/blink-cmp-avante',
    },
    opts = {
      sources = {
        default = { 'avante' },
        providers = {
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
          },
        },
      },
    },
    opts_extend = { 'sources.default' },
  },
}
