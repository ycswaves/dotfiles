local wezterm = require("wezterm")

return {
	-- color_scheme = "Ayu Mirage",
	color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
	-- font = wezterm.font({ family = "VictorMono NF", weight = "DemiBold" }),
	font = wezterm.font({ family = "GeistMono Nerd Font", weight = "Regular" }),
	font_rules = {
		-- Define a rule that matches when italic text is shown
		{
			italic = true,
			font = wezterm.font({ family = "VictorMono NF", style = "Italic", weight = "DemiBold" }),
		},
	},
	font_size = 16,
	keys = {
		{ key = "r", mods = "CMD|SHIFT", action = "ReloadConfiguration" },
	},
	hide_tab_bar_if_only_one_tab = true,
	window_padding = {
		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
	},
}
