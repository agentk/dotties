local M = {}

local function bindLayer(key, name)
  hs.hotkey.bind({ 'ctrl' }, key, function()
    local function launch_webview(url, win)
      local title = 'Keymap'
      local screen = win:screen()
      local max = screen:frame()
      local margin = 100
      local rect = hs.geometry.rect(max.x + margin, max.y + margin, max.w - 2 * margin, max.h - 2 * margin)
      M.wv = hs.webview.new(rect):url(url):allowGestures(true):windowTitle(title):windowStyle(15):deleteOnClose(true):show()
    end

    launch_webview('file:///Users/karl/Developer/Keyboards/zmk-config/docs/index.html#' .. name, hs.window.focusedWindow())
    hs.application.get('Hammerspoon'):activate()
  end)
end

function M.init()
  bindLayer('F1', 'base')
  bindLayer('F2', 'numbers')
  bindLayer('F3', 'symbols')
  bindLayer('F4', 'system')
end

return M
-- vim: ts=2 sts=2 sw=2 et
