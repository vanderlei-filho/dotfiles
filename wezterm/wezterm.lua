local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font
config.font_size = 12
config.line_height = 1.2

-- Colors
config.colors = {
	foreground = "#c0caf5",
	background = "#1a1b26",
	cursor_bg = "#c0caf5",
	cursor_border = "#c0caf5",
	cursor_fg = "#1a1b26",
	selection_bg = "#283457",
	selection_fg = "#c0caf5",
	split = "#7aa2f7",
	compose_cursor = "#ff9e64",
	scrollbar_thumb = "#292e42",
	ansi = { "#15161e", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6" },
	brights = { "#414868", "#ff899d", "#9fe044", "#faba4a", "#8db0ff", "#c7a9ff", "#a4daff", "#c0caf5" },
	tab_bar = {
		inactive_tab_edge = "#16161e",
		background = "#1a1b26",
		active_tab = {
			fg_color = "#16161e",
			bg_color = "#7aa2f7",
		},
		inactive_tab = {
			fg_color = "#545c7e",
			bg_color = "#292e42",
		},
		inactive_tab_hover = {
			fg_color = "#7aa2f7",
			bg_color = "#292e42",
		},
		new_tab_hover = {
			fg_color = "#7aa2f7",
			bg_color = "#1a1b26",
			intensity = "Bold",
		},
		new_tab = {
			fg_color = "#7aa2f7",
			bg_color = "#1a1b26",
		},
	},
}
config.color_scheme = "TokyoNight Night"

-- Window
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 15,
	right = 10,
	top = 15,
	bottom = 15,
}

-- Miscellaneous
config.max_fps = 120
config.prefer_egl = true

-- Disable WezTerm's native multiplexer
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false -- Fixed this line
config.show_tab_index_in_tab_bar = false
config.show_tabs_in_tab_bar = false

-- Key bindings for macOS using Command key (SUPER)
config.disable_default_key_bindings = true
config.keys = {
	-- macOS style Command+C/V for clipboard operations
	{ key = "c", mods = "SUPER", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },

	-- Maintain Ctrl+C for SIGINT (interrupt processes)
	{ key = "c", mods = "CTRL", action = wezterm.action.SendKey({ key = "c", mods = "CTRL" }) },
}

return config
