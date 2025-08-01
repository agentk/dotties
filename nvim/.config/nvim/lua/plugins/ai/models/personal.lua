local copilot = require('plugins.ai.models.copilot')

return {
  provider = 'copilot/gpt-4.1',
  providers = vim.tbl_deep_extend(
    'force',
    copilot({
      'copilot/claude-sonnet-4',
      'copilot/gpt-4.1',
      'copilot/gpt-4o',
      'copilot/gemini-2.0-flash-001',
      'copilot/gemini-2.5-pro',
    }),
    {
      openrouter = {
        __inherited_from = 'openai',
        endpoint = 'https://openrouter.ai/api/v1',
        api_key_name = 'cmd:sops-read OPENROUTER_AVANTE',
        model = 'qwen/qwen3-coder',
      },
    }
  ),
}
