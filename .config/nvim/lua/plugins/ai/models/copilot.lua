local function copilot(model, description)
  return {
    __inherited_from = 'copilot',
    model = model,
    display_name = 'copilot/' .. description .. ' (' .. model .. ')',
    hide_in_model_selector = false,
  }
end

-- Extracted from the list of models returned by Avante
local all_models = {
  ['copilot/claude-3.5-sonnet'] = copilot('claude-3.5-sonnet', 'Claude Sonnet 3.5'),
  ['copilot/claude-3.7-sonnet'] = copilot('claude-3.7-sonnet', 'Claude Sonnet 3.7'),
  ['copilot/claude-3.7-sonnet-thought'] = copilot('claude-3.7-sonnet-thought', 'Claude Sonnet 3.7 Thinking'),
  ['copilot/claude-sonnet-4'] = copilot('claude-sonnet-4', 'Claude Sonnet 4'),
  ['copilot/gpt-3.5-turbo'] = copilot('gpt-3.5-turbo', 'GPT 3.5 Turbo'),
  ['copilot/gpt-3.5-turbo-0613'] = copilot('gpt-3.5-turbo-0613', 'GPT 3.5 Turbo'),
  ['copilot/gpt-4'] = copilot('gpt-4', 'GPT 4'),
  ['copilot/gpt-4-0613'] = copilot('gpt-4-0613', 'GPT 4'),
  ['copilot/gpt-4-0125-preview'] = copilot('gpt-4-0125-preview', 'GPT 4 Turbo'),
  ['copilot/gpt-4.1'] = copilot('gpt-4.1', 'GPT-4.1'),
  ['copilot/gpt-4.1-2025-04-14'] = copilot('gpt-4.1-2025-04-14', 'GPT-4.1'),
  ['copilot/gpt-4-o-preview'] = copilot('gpt-4-o-preview', 'GPT-4o'),
  ['copilot/gpt-4o'] = copilot('gpt-4o', 'GPT-4o'),
  ['copilot/gpt-4o-2024-05-13'] = copilot('gpt-4o-2024-05-13', 'GPT-4o'),
  ['copilot/gpt-4o-2024-08-06'] = copilot('gpt-4o-2024-08-06', 'GPT-4o'),
  ['copilot/gpt-4o-2024-11-20'] = copilot('gpt-4o-2024-11-20', 'GPT-4o'),
  ['copilot/gpt-4o-mini'] = copilot('gpt-4o-mini', 'GPT-4o mini'),
  ['copilot/gpt-4o-mini-2024-07-18'] = copilot('gpt-4o-mini-2024-07-18', 'GPT-4o mini'),
  ['copilot/gemini-2.0-flash-001'] = copilot('gemini-2.0-flash-001', 'Gemini 2.0 Flash'),
  ['copilot/gemini-2.5-pro'] = copilot('gemini-2.5-pro', 'Gemini 2.5 Pro (Preview)'),
  ['copilot/o3-mini'] = copilot('o3-mini', 'o3-mini'),
  ['copilot/o3-mini-2025-01-31'] = copilot('o3-mini-2025-01-31', 'o3-mini'),
  ['copilot/o4-mini'] = copilot('o4-mini', 'o4-mini (Preview)'),
  ['copilot/o4-mini-2025-04-16'] = copilot('o4-mini-2025-04-16', 'o4-mini (Preview)'),
}

return function(keep_keys)
  local result = {}
  for k, v in pairs(all_models) do
    if vim.tbl_contains(keep_keys, k) then result[k] = v end
  end
  return result
end
