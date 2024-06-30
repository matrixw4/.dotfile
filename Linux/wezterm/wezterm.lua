local wezterm = require("wezterm")

local config = {}

-- my favorite color everforest
config.color_scheme = "Everforest Dark (Gogh)"

-- font option
config.font_size = 18
config.font = wezterm.font({
	family = "JetBrainsMonoNL Nerd Font Mono",
	weight = "Light",
	style = "Italic",
	harfbuzz_features = { "liga=1" },
})

-- config.window_background_image = 'C:/Users/yuzih/Noisefigure.png'

--[[config.window_background_image_hsb = {
  brightness = 0.05,
  hue = 1.0,
}]]

-- set uncommon font for comment
config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "Victor Mono",
			weight = "Bold",
			style = "Italic",
		}),
	},
	{
		intensity = "Half",
		italic = true,
		font = wezterm.font({
			family = "Victor Mono",
			weight = "DemiBold",
			style = "Italic",
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "Victor Mono",
			weight = "Bold",
			style = "Italic",
		}),
	},
}

-- set shell
config.default_prog = { "pwsh" }

config.launch_menu = {
	{ label = "Powershell", args = { "pwsh.exe" } },
	{ label = "nushell", args = { "nu.exe" } },
	{ label = "CMD", args = { "cmd.exe" } },
}

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.show_new_tab_button_in_tab_bar = false

config.window_background_opacity = 0.85
-- config.macos_window_background_blur = 70
config.text_background_opacity = 0.8
-- config.win32_system_backdrop = 'Acrylic'

config.adjust_window_size_when_changing_font_size = false

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "BlinkingBlock"
config.enable_kitty_graphics = true

config.disable_default_key_bindings = true
config.keys = {
	{
		key = "c",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ CopyTo = "Clipboard" }),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ PasteFrom = "Clipboard" }),
	},
	{
		key = [[\]],
		mods = "CTRL|ALT",
		action = wezterm.action({
			SplitHorizontal = { domain = "CurrentPaneDomain" },
		}),
	},
	{
		key = [[\]],
		mods = "ALT",
		action = wezterm.action({
			SplitVertical = { domain = "CurrentPaneDomain" },
		}),
	},
	{
		key = "q",
		mods = "CTRL",
		action = wezterm.action({
			CloseCurrentPane = { confirm = false },
		}),
	},
	{
		key = "n",
		mods = "CTRL",
		action = wezterm.action.ShowLauncher,
	},
	{
		key = "w",
		mods = "CTRL",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "1",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 0 }),
	},
	{
		key = "2",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 1 }),
	},
	{
		key = "3",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 2 }),
	},
	{
		key = "4",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 3 }),
	},
	{
		key = "5",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 4 }),
	},
	{
		key = "6",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 5 }),
	},
	{
		key = "7",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 6 }),
	},
	{
		key = "8",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 7 }),
	},
	{
		key = "9",
		mods = "ALT",
		action = wezterm.action({ ActivateTab = 8 }),
	},
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action({ ActivatePaneDirection = "Left" }),
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action({ ActivatePaneDirection = "Right" }),
	},
	{
		key = "j",
		mods = "ALT",
		action = wezterm.action({ ActivatePaneDirection = "Up" }),
	},
	{
		key = "k",
		mods = "ALT",
		action = wezterm.action({ ActivatePaneDirection = "Down" }),
	},
	{
		key = "h",
		mods = "ALT|SHIFT",
		action = wezterm.action({ AdjustPaneSize = { "Left", 1 } }),
	},
	{
		key = "l",
		mods = "ALT|SHIFT",
		action = wezterm.action({ AdjustPaneSize = { "Right", 1 } }),
	},
	{
		key = "k",
		mods = "ALT|SHIFT",
		action = wezterm.action({ AdjustPaneSize = { "Up", 1 } }),
	},
	{
		key = "j",
		mods = "ALT|SHIFT",
		action = wezterm.action({ AdjustPaneSize = { "Down", 1 } }),
	},
	{
		key = "F11",
		mods = "NONE",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
