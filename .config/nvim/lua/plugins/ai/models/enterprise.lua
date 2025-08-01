local function genai(model, opts)
  local output_tokens = opts and opts.output_tokens or 4096
  -- local reasoning_effort = opts and opts.reasoning_effort or 'medium' -- low|medium|high, only used for reasoning models
  return {
    __inherited_from = 'openai',
    endpoint = 'https://api.studio.genai.cba/v1',
    api_key_name = 'cmd:sops-read GENAI_API_KEY',
    model = model,
    extra_request_body = {
      timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
      temperature = 0.75,
      max_completion_tokens = output_tokens, -- Increase this to include reasoning tokens (for reasoning models)
      -- reasoning_effort = reasoning_effort, -- low|medium|high, only used for reasoning models
    },
  }
end

local copilot = require('plugins.ai.models.copilot')

return {
  provider = 'genai/claude-3.7-sonnet',
  auto_suggestions_provider = 'copilot',
  providers = vim.tbl_deep_extend(
    'force',
    copilot({
      'copilot/claude-sonnet-3.7',
      'copilot/claude-sonnet-3.7-thought',
      'copilot/gpt-4.1',
      'copilot/gpt-4o',
      'copilot/gemini-2.0-flash-001',
    }),
    {
      ['genai/claude-3.5-sonnet'] = genai('bedrock-claude-3.5-sonnet-v2', { output_tokens = 8 }),
      ['genai/claude-3.7-sonnet'] = genai('bedrock-claude-3.7-sonnet', { output_tokens = 8 }),
      ['genai/claude-4-sonnet'] = genai('bedrock-claude-4-sonnet', { output_tokens = 8 }),
      ['genai/gemini-2.0-flash'] = genai('gemini-2.0-flash-001', { output_tokens = 8 }),
      ['genai/gtp-4.1'] = genai('gpt-4.1_v2025-04-14_GLOBAL', { output_tokens = 16 }),
      ['genai/gtp-4o'] = genai('gpt-4o_v2024-11-20_USEAST', { output_tokens = 16 }),
      ['genai/gtp-4o-mini'] = genai('gpt-4o-mini_v2024-07-18', { output_tokens = 4 }),
      ['genai/o3-mini'] = genai('o3-mini_v2025-07-18_EASTUS2', { output_tokens = 64 }),
    }
  ),
}
