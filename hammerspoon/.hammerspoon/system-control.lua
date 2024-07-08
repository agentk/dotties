local windowManagement = require('window-management')

local watcher

local M = {}

function M.init(hyper)
  -- Hyper-0: Reload hammerspoon
  hyper.bind('0', function()
    hs.alert('Restarting Hammerspoon')
    hs.console.clearConsole()
    hs.reload()
  end)

  -- HS Console customisation
  -- hs.console.darkMode(true)
  -- hs.console.outputBackgroundColor({ white = 0 })
  -- hs.console.consoleCommandColor({ white = 1 })
  -- hs.console.alpha(1)

  hyper.bind('9', function()
    local win = hs.console.hswindow()
    if win ~= nil then
      hs.application.launchOrFocus('Hammerspoon')
      windowManagement.positionWindow(windowManagement.frameRight)
      print('✅ Internal window found')
      return
    end

    watcher = hs.application.watcher.new(function(name, eventType, _)
      if eventType == hs.application.watcher.activated and name == 'Hammerspoon' then
        print('✅ Watcher activated')
        watcher:stop()
        hs.timer.doAfter(0.05, function()
          win = hs.console.hswindow()
          if win == nil then
            return
          end
          local f = win:frame()
          local screen = win:screen()
          local max = screen:frame()
          windowManagement.frameRight(f, max)
          win:setFrame(f)
        end)
      end
    end)
    watcher:start()
    hs.application.launchOrFocus('Hammerspoon')
  end)
end

return M
-- vim: ts=2 sts=2 sw=2 et
