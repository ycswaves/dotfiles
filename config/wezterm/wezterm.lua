local wezterm = require 'wezterm';

return {
  color_scheme = "Ayu Mirage",
  font = wezterm.font(
    { family = "VictorMono NF", weight = "DemiBold" }
  ),
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
    left = 2,
    right = 2,
    top = 5,
    bottom = 10,
  },
}
