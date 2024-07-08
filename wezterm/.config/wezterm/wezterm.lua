local wezterm = require("wezterm")
local config = wezterm.config_builder()

local act = wezterm.action

config.color_scheme = "tokyonight"
config.font = wezterm.font("Fira Code")
config.font_size = 14.0
config.adjust_window_size_when_changing_font_size = false
config.use_fancy_tab_bar = false
config.enable_scroll_bar = true
config.window_padding = {
	left = "0.5cell",
	right = "1cell",
	top = "0.5cell",
	bottom = "0.1cell",
}
-- \x1b is the ESC character
config.keys = {
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = act.SendString("\x1bb") },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = act.SendString("\x1bf") },
}

config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

return config
