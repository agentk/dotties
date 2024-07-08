local M = {}

function M.init(hyper)
  local mapping = {
    d = 'Discord',
    n = 'Notes',
    o = 'Obsidian',
    s = 'Safari',
    t = 'Ghostty',
  }

  for key, app in pairs(mapping) do
    hyper.bind(key, app, function()
      hs.application.launchOrFocus(app)
    end)
  end
end

return M
-- vim: ts=2 sts=2 sw=2 et
