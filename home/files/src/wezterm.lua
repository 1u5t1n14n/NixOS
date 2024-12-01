local wezterm = require("wezterm")
local config = wezterm.config_builder()
--config.default_prog = { "fish", "-l" }

config.enable_wayland = true

config.front_end = "WebGpu"

config.webgpu_power_preference = "HighPerformance"

--config.font = wezterm.font("JetBrainsMono")
config.font_size = 11.0
config.enable_tab_bar = false
--config.text_background_opacity = 0.5

local mux = wezterm.mux

wezterm.on("gui-startup", function(window)
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:maximize()
end)
return config
