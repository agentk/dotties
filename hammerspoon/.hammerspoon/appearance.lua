local M = {}

-- Reference: https://github.com/chrisgrieser/.config/blob/main/hammerspoon/appearance/dark-mode.lua

---@param msg string
local function logBrightness(msg)
  local ambient = hs.brightness.ambient()
  print(('💡 %s (ambient %.1f)'):format(msg, ambient)) -- `%.1f` = round to 1 decimal
end

---@nodiscard
---@return boolean
local function isDarkMode()
  return hs.execute('defaults read -g AppleInterfaceStyle') == 'Dark\n'
end

local function setHammerspoonColors(toMode)
  hs.console.darkMode(toMode == 'dark')
  hs.console.outputBackgroundColor({ white = toMode == 'dark' and 0.1 or 0.9 })
  hs.console.consoleCommandColor({ white = toMode == 'dark' and 0.9 or 0.1 })
  hs.console.alpha(1)

  hs.alert.defaultStyle.strokeWidth = 1
  hs.alert.defaultStyle.strokeColor = { white = toMode == 'dark' and 0.5 or 0.5 }
  hs.alert.defaultStyle.fillColor = { white = toMode == 'dark' and 0 or 1 }
  hs.alert.defaultStyle.textColor = { white = toMode == 'dark' and 0.8 or 0.2 }
  hs.alert.defaultStyle.textSize = 18
  hs.alert.defaultStyle.radius = 4
end

-- INFO done manually to include app-specific toggling for:
-- * System
-- * Neovim
-- * Sketchybar
-- * Highlights PDF appearance
-- * Hammerspoon Console
---@param toMode "dark"|"light"
local function setDarkMode(toMode)
  -- System
  local applescript = 'tell application "System Events" to tell appearance preferences to set dark mode to ' .. (toMode == 'light' and 'false' or 'true')
  hs.osascript.applescript(applescript)

  -- hammerspoon itself
  -- console.setConsoleColors(toMode)
  setHammerspoonColors(toMode)
end

function M.init(hyper)
  hyper.bind('7', function()
    local toMode = isDarkMode() and 'light' or 'dark'
    setDarkMode(toMode)
    logBrightness(('Manually toggled %s mode'):format(toMode))
    hs.alert((toMode == 'dark' and 'Dark' or 'Light') .. (' mode - 💡 ambiance %.1f'):format(hs.brightness.ambient()))
  end)

  setHammerspoonColors(isDarkMode() and 'dark' or 'light')
end

return M
-- vim: ts=2 sts=2 sw=2 et
