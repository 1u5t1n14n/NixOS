local wezterm = require("wezterm")
local config = wezterm.config_builder()
--config.default_prog = { "fish", "-l" }

config.enable_wayland = false
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 11.0
config.enable_tab_bar = false

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

config.window_background_opacity = 0.9
config.text_background_opacity = 1.0

config.color_scheme = "Kanagawa (Gogh)"
--config.window_decorations = "NONE" (is kinda not working)

local mux = wezterm.mux
wezterm.on("gui-startup", function(window)
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:maximize()
end)
return config
