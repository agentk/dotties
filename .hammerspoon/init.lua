hs.loadSpoon('EmmyLua')

-- Make window animations snappy
hs.window.animationDuration = 0.05

local hyper = require('hyper')
require('alert-style').init()
require('app-management').init(hyper)
require('appearance').init(hyper)
require('caffeine').init(hyper)
require('keyboard-overlay').init()
require('system-control').init(hyper)
require('window-management').init(hyper)

hs.alert('Hammerspoon started')
-- vim: ts=2 sts=2 sw=2 et
