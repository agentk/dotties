local M = {}

-- A global variable for the Hyper Mode
---@class hs.hotkey.modal
M.hyper = hs.hotkey.modal.new({}, 'F18')

-- Enter Hyper Mode when Hyper Caps (F19) is pressed
local function enterHyperMode()
  M.hyper.triggered = false
  M.hyper:enter()
end

-- Leave Hyper Mode when Hyper Caps (F19) is pressed,
-- send ESCAPE if no other keys are pressed.
local function exitHyperMode()
  M.hyper:exit()
  if not M.hyper.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
hs.hotkey.bind({}, 'F19', enterHyperMode, exitHyperMode)

return M
-- vim: ts=2 sts=2 sw=2 et
