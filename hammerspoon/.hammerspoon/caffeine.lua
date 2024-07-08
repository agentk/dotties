local M = {}

function M.init(hyper)
  local key = 'caffeinated'

  local function showStatus()
    local value = hs.settings.get(key)
    if value then
      hs.alert('Caffeinated ☕️')
    else
      hs.alert('Decaffeinated 💤')
    end
  end

  local initialValue = hs.settings.get(key)
  hs.caffeinate.set('displayIdle', initialValue, initialValue)
  showStatus()

  hyper.bind('8', function()
    hs.settings.set(key, hs.caffeinate.toggle('displayIdle'))
    showStatus()
  end)
end

return M
-- vim: ts=2 sts=2 sw=2 et
