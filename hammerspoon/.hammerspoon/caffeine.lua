local M = {}

function M.init()
  M.caffeine = hs.menubar.new()
  local function setCaffeineDisplay(state)
    if state then
      M.caffeine:setTitle('☕️')
    else
      M.caffeine:setTitle('💤')
    end
  end

  local function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle('displayIdle'))
  end

  if M.caffeine then
    M.caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get('displayIdle'))
  end
end

return M
-- vim: ts=2 sts=2 sw=2 et
