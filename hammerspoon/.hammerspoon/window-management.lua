local windowManagement = {}

function windowManagement.positionWindow(callback)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  callback(f, max)
  win:setFrame(f)
end

function windowManagement.frameFullscreen(f, max)
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
end

function windowManagement.frameLeft(f, max)
  f.x = max.x
  f.y = max.y
  f.w = (max.w / 2)
  f.h = max.h
end

function windowManagement.frameRight(f, max)
  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = (max.w / 2)
  f.h = max.h
end

function windowManagement.frameUp(f, max)
  f.x = max.x + (max.w / 6)
  f.y = max.y
  f.w = (max.w * 2 / 3)
  f.h = max.h
end

function windowManagement.frameDown(f, max)
  f.x = max.x
  f.y = max.y + max.h / 2
  f.w = max.w
  f.h = max.h / 2
end

function windowManagement.init(hyper)
  hyper.bind('f', function()
    windowManagement.positionWindow(windowManagement.frameFullscreen)
  end)

  hyper.bind('c', function()
    hs.window.focusedWindow():centerOnScreen(nil, true)
  end)

  hyper.bind('p', function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    hs.window.focusedWindow():centerOnScreen(screen:next(), true)
  end)

  hyper.bind('left', function()
    windowManagement.positionWindow(windowManagement.frameLeft)
  end)

  hyper.bind('right', function()
    windowManagement.positionWindow(windowManagement.frameRight)
  end)

  hyper.bind('up', function()
    windowManagement.positionWindow(windowManagement.frameUp)
  end)

  hyper.bind('down', function()
    windowManagement.positionWindow(windowManagement.frameDown)
  end)
end

return windowManagement
-- vim: ts=2 sts=2 sw=2 et
