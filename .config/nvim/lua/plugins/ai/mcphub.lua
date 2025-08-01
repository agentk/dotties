return {

  {
    'ravitemer/mcphub.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- Installs `mcp-hub` node binary globally
    build = 'npm install -g mcp-hub@latest',
    opts = {
      ---Chat-plugin related options-----------------
      -- Auto approve mcp tool calls
      auto_approve = false,
      -- Let LLMs start and stop MCP servers automatically
      auto_toggle_mcp_servers = true,
      extensions = {
        avante = {
          enabled = true,
          -- make /slash commands from MCP server prompts
          make_slash_commands = true,
        },
      },
      --- Plugin specific options-------------------
      ui = {
        window = {
          -- "none", "single", "double", "rounded", "solid", "shadow"
          border = 'solid',
        },
      },
    },
    config = function(_, opts) require('mcphub').setup(opts) end,
  },
}
