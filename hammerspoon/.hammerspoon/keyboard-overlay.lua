local M = {}

local alerts = {}

local function startLayer(key, name)
  alerts[key] = hs.alert.show('Layer: ' .. name, nil, nil, '')
end

local function endLayer(key)
  hs.alert.closeSpecific(alerts[key])
end

local function bindLayer(key, name)
  hs.hotkey.bind({ 'ctrl' }, key, function()
    startLayer(key, name)
  end, function()
    endLayer(key)
  end)
end

function M.init()
  bindLayer('F1', 'Default')
  bindLayer('F2', 'Lower')
  bindLayer('F3', 'Magic')
  bindLayer('F4', 'Cursor')
  bindLayer('F5', 'Number')
  bindLayer('F6', 'Function')
  bindLayer('F7', 'Symbol')
  bindLayer('F8', 'Mouse')
  bindLayer('F9', 'System')
  bindLayer('F10', 'Typing')

  -- hs.hotkey.bind({ 'ctrl' }, 'F1', function()
  --   hs.alert.show('Layer Default')
  --
  --   function launch_webview(url, win)
  --     local title = 'Hammerspoon WebView Window'
  --     local screen = win:screen()
  --     local max = screen:frame()
  --     local margin = 100
  --     local rect = hs.geometry.rect(max.x + margin, max.y + margin, max.w - 2 * margin, max.h - 2 * margin)
  --     M.wv = hs.webview.new(rect):url(url):allowGestures(true):windowTitle(title):windowStyle(15):deleteOnClose(true):show()
  --   end
  --
  --   launch_webview('https://learnxinyminutes.com/docs/lua/', hs.window.focusedWindow())
  --   hs.application.get('Hammerspoon'):activate()
  -- end, function()
  --   M.wv:delete()
  -- end)
end

return M
-- vim: ts=2 sts=2 sw=2 et
