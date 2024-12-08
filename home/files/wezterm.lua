local wezterm = require("wezterm")
local config = wezterm.config_builder()
--config.default_prog = { "fish", "-l" }

config.enable_wayland = false
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.0
config.enable_tab_bar = false
config.audible_bell = "Disabled"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.Nop,
	},
}

config.window_background_opacity = 1.0
config.text_background_opacity = 1.0

return config
